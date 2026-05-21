extends Sprite2D


var fill_textures: Array[Resource] = [
	# preload("res://assets/icons/rhombus.svg"),
	preload("res://assets/icons/d3.svg"),
	preload("res://assets/icons/d12.svg"),
	preload("res://assets/icons/d4.svg"),
	preload("res://assets/icons/hexagon.svg"),
	preload("res://assets/icons/pentagon.svg"),
]

var outline_textures: Array[Resource] = [
	# preload("res://assets/icons/rhombus_outline.svg"),
	preload("res://assets/icons/d3_outline.svg"),
	preload("res://assets/icons/d12_outline.svg"),
	preload("res://assets/icons/d4_outline.svg"),
	preload("res://assets/icons/hexagon_outline.svg"),
	preload("res://assets/icons/pentagon_outline.svg"),
]


@export var fill_mode: bool = true:
	set(value):
		fill_mode = value
		_update()


@export var color: Constants.BloomColor:
	set(value):
		color = value
		_update()


func _update_texture() -> void:
	texture = fill_textures[color] if fill_mode else outline_textures[color]


func _update() -> void:
	self_modulate = Constants.BGColors[color]
	_update_texture()


func _ready() -> void:
	_update()
