-- Generated model-driven entity + direct tests.
{-# LANGUAGE ScopedTypeVariables #-}

module SdkGenTests (genTests) where

import Control.Exception (SomeException, try)
import Data.IORef

import VoxgigStruct (Value (..), emptyMap, keysof, ismap, islist, isNoval, clone)
import SdkTypes
import SdkHelpers
import qualified SdkFeatures as F
import qualified SdkClient as C
import qualified TReadmeExamples
import Testutil
import SdkJson (jsonRead)

-- Load an entity fixture (../.sdk/test/entity/<name>/<Name>TestData.json).
loadFixture :: String -> IO Value
loadFixture entName = do
  -- The fixture DIRECTORY is the snake_case entity name (create_result), so a
  -- plain lowercase of the CamelCase entName (createresult) misses the
  -- underscores for multi-word entities. Convert CamelCase -> snake_case.
  let lname = camelToSnake entName
  raw <- readUtf8 ("../.sdk/test/entity/" ++ lname ++ "/" ++ entName ++ "TestData.json")
  jsonRead raw
  where
    toLowerCh ch = if ch >= 'A' && ch <= 'Z' then toEnum (fromEnum ch + 32) else ch
    camelToSnake [] = []
    camelToSnake (c0 : rest) = toLowerCh c0 : go rest
    go [] = []
    go (c : cs)
      | c >= 'A' && c <= 'Z' = '_' : toLowerCh c : go cs
      | otherwise = c : go cs

-- The first new-ref data map for an entity (fixture.new.<entity>.<ref0>).
newRefData :: Value -> String -> IO Value
newRefData fixture entName = do
  newEnts <- getpathS fixture ("new." ++ entName)
  refs <- keysof newEnts
  case refs of
    [] -> emptyMap
    (r0 : _) -> do d <- getp newEnts r0; clone d

genTests :: Counters -> IO ()
genTests c = do
  TReadmeExamples.tests c
  network_token_bundleInstanceTest c
  network_token_bundleBasicTest c
  network_token_bundleDirectTest c

network_token_bundleInstanceTest :: Counters -> IO ()
network_token_bundleInstanceTest c = runTest c "network_token_bundle.instance" $ do
  sdk <- C.testSdk0
  ent <- C.network_token_bundle sdk VNoval
  pure (eName ent == "network_token_bundle")

network_token_bundleBasicTest :: Counters -> IO ()
network_token_bundleBasicTest c = do
  fixture <- loadFixture "NetworkTokenBundle"
  existing <- getp fixture "existing"
  opts <- jo [("entity", existing)]
  runTest c "network_token_bundle.load" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.network_token_bundle sdk VNoval
    entmap <- getp existing "network_token_bundle"
    ids <- keysof entmap
    case ids of
      [] -> pure True
      (id0 : _) -> do
        m <- jo [("id", VStr id0)]; ctrl <- emptyMap
        loaded <- eLoad ent m ctrl
        ld <- eDataGet loaded
        lid <- getp ld "id"
        pure (ismap ld && vstring lid == id0)
  runTest c "network_token_bundle.create" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.network_token_bundle sdk VNoval
    d <- newRefData fixture "network_token_bundle"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cd <- eDataGet created
    -- The create RESULT is a map. Deliberately NOT "and it carries an id":
    -- a create response need not return one. univec's convert, embed and
    -- ephemeral_key all answer {success, data:{...}} with no id, so this
    -- target failed three entity tests the go target passes -- go asserts
    -- only that the result is a map, and that is the assertion the model
    -- actually supports.
    pure (ismap cd)
  runTest c "network_token_bundle.remove" $ do
    sdk <- C.testSdk opts VNoval
    ent <- C.network_token_bundle sdk VNoval
    d <- newRefData fixture "network_token_bundle"
    ctrl <- emptyMap
    created <- eCreate ent d ctrl
    cd <- eDataGet created
    cid <- getp cd "id"
    rm <- jo [("id", cid)]; ctrl2 <- emptyMap
    -- `remove` resolves to the entity, marked. It KEEPS the data it held.
    removed <- eRemove ent rm ctrl2
    gone <- readIORef (eDeleted removed)
    rd <- eDataGet removed
    rid <- getp rd "id"
    pure (gone && vstring rid == vstring cid)

network_token_bundleDirectTest :: Counters -> IO ()
network_token_bundleDirectTest c = runTest c "network_token_bundle.direct" $ do
  calls <- newIORef (0 :: Int)
  let mock = VFunc (\_ _ _ _ -> do
        modifyIORef calls (+ 1)
        d <- jo [("id", VStr "direct01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk d)])
  sys <- jo [("fetch", mock)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  sdk <- C.newSdk opts
  args <- jo [("path", VStr "/network_token_bundle/x"), ("method", VStr "GET")]
  res <- F.direct sdk args
  ok <- getp res "ok"
  st <- getp res "status"
  dat <- getp res "data"
  did <- getp dat "id"
  n <- readIORef calls
  pure (isTrueV ok && toInt st == 200 && vstring did == "direct01" && n == 1)
