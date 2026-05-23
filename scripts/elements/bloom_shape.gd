extends BloomColor

@onready var icon: Sprite2D = $Icon


const fill_textures: Array[Resource] = [
	preload("res://assets/icons/rhombus.svg"),
	preload("res://assets/icons/d4.svg"),
	preload("res://assets/icons/d3.svg"),
	preload("res://assets/icons/hexagon.svg"),
	preload("res://assets/icons/pentagon.svg"),
	preload("res://assets/icons/d12.svg"),
]

const outline_textures: Array[Resource] = [
	preload("res://assets/icons/rhombus_outline.svg"),
	preload("res://assets/icons/d4_outline.svg"),
	preload("res://assets/icons/d3_outline.svg"),
	preload("res://assets/icons/hexagon_outline.svg"),
	preload("res://assets/icons/pentagon_outline.svg"),
	preload("res://assets/icons/d12_outline.svg"),
]


@export var fill_mode: bool:
	set(value):
		fill_mode = value
		_update_texture()


func _update_texture() -> void:
	icon.texture = fill_textures[color] if fill_mode else outline_textures[color]


func _update_color() -> void:
	icon.self_modulate = Constants.BGColors[color]
	_update_texture()


func _ready() -> void:
	_update()
