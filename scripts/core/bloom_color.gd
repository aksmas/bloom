class_name BloomColor
extends Node2D


@export var color: Constants.BloomColor:
	set(value):
		color = value
		if is_node_ready():
			_update_color()


func _update_color() -> void:
	pass


func _update() -> void:
	_update_color()


func _setup() -> void:
	pass


func _ready() -> void:
	_setup()
	_update()
