extends Panel

@onready var manager: GameManagerCore = $".."


func _process(_delta: float) -> void:
	if manager.status == CoreConstants.GameState.LOBBY:
		visible = true
	else:
		visible = false


func add_player(name: String) -> void:
	manager.add_player(PlayerCore.new())
