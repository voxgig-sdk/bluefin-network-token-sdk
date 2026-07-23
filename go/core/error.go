package core

type BluefinNetworkTokenError struct {
	IsBluefinNetworkTokenError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBluefinNetworkTokenError(code string, msg string, ctx *Context) *BluefinNetworkTokenError {
	return &BluefinNetworkTokenError{
		IsBluefinNetworkTokenError: true,
		Sdk:              "BluefinNetworkToken",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BluefinNetworkTokenError) Error() string {
	return e.Msg
}
