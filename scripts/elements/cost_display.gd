extends Node2D


@onready var label: Label = $CostLabel
@onready var bg_scene: Sprite2D = $BloomIcon


@export var cost: int:
	set(value):
		cost = value
		_update_cost()


@export var color: Constants.BloomColor:
	set(value):
		color = value
		bg_scene.color = color
		label.label_settings.font_color = Constants.FontColors[color]


func _update_cost() -> void:
	if cost > 0:
		label.text = str(cost)
		show()
	else:
		hide()


func _ready() -> void:
	label.label_settings = LabelSettings.new()
	label.label_settings.font_size = 40
	_update_cost()
