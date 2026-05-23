class_name BloomColor
extends Bloom2D


@export var color: Constants.BloomColor:
	set(value):
		color = value
		if is_node_ready():
			_update_color()


func _update_color() -> void:
	pass


func _update() -> void:
	_update_color()
