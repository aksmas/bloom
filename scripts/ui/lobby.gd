extends ColorRect

@onready var manager: GameManagerCore = $".."


func _ready() -> void:
	show()


func show_error(message: String) -> void:
	$ErrorLabel.text = message
	$ErrorLabel.show()
	$ErrorLabel/Timer.start(2)


func _update_player_display() -> void:
	var txt := ""
	$NewPlayer.text = txt
	for player in manager.players:
		txt += ("Player%d \n" % player.ID) + player.NAME + "\n\n"
	$Players.text = txt


func add_player() -> void:
	var pname: String = $NewPlayer.text
	if pname.length() < 3:
		show_error("Player Name should be atleast 3 letters")
		return
	var valid := manager.add_player(PlayerCore.new(manager.players.size() + 1, pname))
	if not valid:
		show_error("Game is full")
	_update_player_display()


func start_game() -> void:
	var valid := manager.start()
	if not valid:
		show_error("Need atleast 2 Players to Start")
		return
	hide()
	$"../Table".setup()
