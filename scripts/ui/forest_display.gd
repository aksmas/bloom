extends ColorRect

var FOREST: ForestCore
var color1: CoreConstants.BloomColor
var color2: CoreConstants.BloomColor
var color3: CoreConstants.BloomColor

var mode := false
@onready var take_buttons := [
	$Info/White/TakeButton,
	$Info/Red/TakeButton,
	$Info/Pink/TakeButton,
	$Info/Purple/TakeButton,
	$Info/Yellow/TakeButton
]


signal take_wild()
signal take_flowers(color1: CoreConstants.BloomColor, color2: CoreConstants.BloomColor, color3: CoreConstants.BloomColor)


func _reset() -> void:
	@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
	color1 = -1
	@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
	color2 = -1
	@warning_ignore("int_as_enum_without_cast", "int_as_enum_without_match")
	color3 = -1


func _show_take_buttons(t: bool) -> void:
	for button in take_buttons:
		button.visible = t
	$Info/Wild/TakeButton.visible = t


func _wild_message() -> String:
	return "Take a wild flower?"


func _flower_2_same_message() -> String:
	return "Take 2 " + CoreConstants.BloomColor.keys()[color1] + " flowers?"


func _flower_3_diff_message() -> String:
	return (
		"Take " + CoreConstants.BloomColor.keys()[color1] + " , " 
		+ CoreConstants.BloomColor.keys()[color2] + " and " 
		+ CoreConstants.BloomColor.keys()[color3] + " flowers?"
	)


func confirmation_mode(message: String) -> void:
	$ConfirmPanel/MessageLabel.text = message
	$ConfirmPanel.show()
	_show_take_buttons(false)


func take_mode() -> void:
	$ConfirmPanel.hide()
	_show_take_buttons(true)
	_reset()


func _ready() -> void:
	take_mode()


func update() -> void:
	$Info/White/FlowerLabel.text = str(FOREST.FLOWERS.WHITE)
	$Info/Red/FlowerLabel.text = str(FOREST.FLOWERS.RED)
	$Info/Pink/FlowerLabel.text = str(FOREST.FLOWERS.PINK)
	$Info/Purple/FlowerLabel.text = str(FOREST.FLOWERS.PURPLE)
	$Info/Yellow/FlowerLabel.text = str(FOREST.FLOWERS.YELLOW)
	$Info/Wild/FlowerLabel.text = str(FOREST.WILDS)
	take_mode()


func setup(forest: ForestCore) -> void:
	FOREST = forest
	update()


func _hide_selected_colors() -> void:
	take_buttons[color1].hide()
	take_buttons[color2].hide()


func update_taken(ncolor: CoreConstants.BloomColor) -> void:
	if color1 == -1:
		color1 = ncolor
	elif color2 == -1:
		color2 = ncolor
		if color1 == color2:
			confirmation_mode(_flower_2_same_message())
		else:
			_hide_selected_colors()
	elif color3 == -1:
		color3 = ncolor
		confirmation_mode(_flower_3_diff_message())
	else:
		return


func wild_taken() -> void:
	confirmation_mode(_wild_message())


func emit_relevant_signal() -> void:
	if color1 == -1:
		take_wild.emit()
	else:
		take_flowers.emit(color1, color2, color3)
	$ConfirmPanel.hide()
