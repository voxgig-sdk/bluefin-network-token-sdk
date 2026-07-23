package voxgig.bluefinnetworktokensdk.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import voxgig.bluefinnetworktokensdk.core.Context;
import voxgig.bluefinnetworktokensdk.core.Entity;
import voxgig.bluefinnetworktokensdk.core.Helpers;
import voxgig.bluefinnetworktokensdk.core.SdkClient;
import voxgig.bluefinnetworktokensdk.utility.struct.Struct;

/** NetworkTokenBundle entity client for the BluefinNetworkToken SDK. */
@SuppressWarnings({"unchecked", "unused"})
public class NetworkTokenBundleEntity extends EntityBase {

  public NetworkTokenBundleEntity(SdkClient client, Map<String, Object> entopts) {
    super("network_token_bundle", client, entopts);
  }

  @Override
  public Entity make() {
    Map<String, Object> opts = new LinkedHashMap<>(this.entopts);
    return new NetworkTokenBundleEntity(this.client, opts);
  }


  @Override
  public Object load(Map<String, Object> reqmatch, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "load");
    ctxmap.put("ctrl", ctrl);
    ctxmap.put("match", this.match);
    ctxmap.put("data", this.data);
    ctxmap.put("reqmatch", reqmatch);
    Context ctx = this.utility.makeContext.apply(ctxmap, this.entctx);

    return runOp(ctx, () -> {
      if (ctx.result != null) {
        if (ctx.result.resmatch != null) {
          this.match = ctx.result.resmatch;
        }
        if (ctx.result.resdata != null) {
          Map<String, Object> d = Helpers.toMapAny(Struct.clone(ctx.result.resdata));
          this.data = d == null ? new LinkedHashMap<>() : d;
        }
      }
    });
  }



  @Override
  public Object list(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("list", this.name);
  }



  @Override
  public Object create(Map<String, Object> reqdata, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "create");
    ctxmap.put("ctrl", ctrl);
    ctxmap.put("match", this.match);
    ctxmap.put("data", this.data);
    ctxmap.put("reqdata", reqdata);
    Context ctx = this.utility.makeContext.apply(ctxmap, this.entctx);

    return runOp(ctx, () -> {
      if (ctx.result != null) {
        if (ctx.result.resdata != null) {
          Map<String, Object> d = Helpers.toMapAny(Struct.clone(ctx.result.resdata));
          this.data = d == null ? new LinkedHashMap<>() : d;
        }
      }
    });
  }



  @Override
  public Object update(Map<String, Object> req, Map<String, Object> ctrl) {
    throw Helpers.unsupportedOp("update", this.name);
  }



  @Override
  public Object remove(Map<String, Object> reqmatch, Map<String, Object> ctrl) {
    Map<String, Object> ctxmap = new LinkedHashMap<>();
    ctxmap.put("opname", "remove");
    ctxmap.put("ctrl", ctrl);
    ctxmap.put("match", this.match);
    ctxmap.put("data", this.data);
    ctxmap.put("reqmatch", reqmatch);
    Context ctx = this.utility.makeContext.apply(ctxmap, this.entctx);

    return runOp(ctx, () -> {
      if (ctx.result != null) {
        if (ctx.result.resmatch != null) {
          this.match = ctx.result.resmatch;
        }
        if (ctx.result.resdata != null) {
          Map<String, Object> d = Helpers.toMapAny(Struct.clone(ctx.result.resdata));
          this.data = d == null ? new LinkedHashMap<>() : d;
        }
      }
    });
  }


}
