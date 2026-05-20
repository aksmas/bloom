extends Panel

@onready var manager: GameManagerCore = $".."
@onready var shop_displays := [$Shop0, $Shop1, $Shop2]
@onready var player_displays := [$Player0, $Player1, $Player2, $Player3]
@onready var forest_display := $Forest

var MODE: CoreConstants.Action


func _ready() -> void:
	hide()


func _hide_players() -> void:
	for display in player_displays:
		display.hide()


func reset_mode() -> void:
	MODE = CoreConstants.Action.SHOP


func setup() -> void:
	for i in range(shop_displays.size()):
		shop_displays[i].setup(manager.shops[i])
	forest_display.setup(manager.forest)
	_hide_players()
	update()
	show()


func _update_players() -> void:
	for i in range(player_displays.size()):
		if i < manager.players.size():
			player_displays[i].update(manager.players[(manager.current_player + i) % manager.players.size()])
			player_displays[i].show()


func update() -> void:
	for shop in shop_displays:
		shop.update()
	forest_display.update()
	_update_players()
	reset_mode()


func reserve_mode() -> void:
	MODE = CoreConstants.Action.WILD


func _next_turn() -> void:
	manager.end_turn(-1)
	update()


func plant_selected_action(shop_id: int, plant_id: int) -> void:
	if manager.take_action(MODE, shop_id, plant_id):
		_next_turn()
	else:
		update()


func forage_action(
	color1: CoreConstants.BloomColor, 
	color2: CoreConstants.BloomColor, 
	color3: CoreConstants.BloomColor
) -> void:
	if manager.take_action(CoreConstants.Action.FORAGE, -1, -1, color1, color2, color3):
		_next_turn()
	else:
		update()
