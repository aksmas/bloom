extends Node2D

@onready var tulips: Array[Sprite2D] = [
	$TulipIcon0, $TulipIcon1, $TulipIcon2, $TulipIcon3,
]

@export var count: int:
	set(value):
		count = value
		if is_node_ready():
			_update_count()


@export var color: Constants.BloomColor:
	set(value):
		color = value
		if is_node_ready():
			_update_color()


func _update_count() -> void:
	for i in range(tulips.size()):
		tulips[i].visible = i < count


func _update_color() -> void:
	for tulip in tulips:
		tulip.color = color


func _ready() -> void:
	_update_count()
	_update_color()
