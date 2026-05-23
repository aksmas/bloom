class_name BloomColorCount
extends BloomColor


@export var count: int:
	set(value):
		count = value
		if is_node_ready():
			_update_count()


func _update_count() -> void:
	pass


func _update() -> void:
	_update_color()
	_update_count()
