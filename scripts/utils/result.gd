class_name Result

var success: bool
var message: String

func _init(ok: bool, msg: String = "OK"):
	success = ok
	message = msg
