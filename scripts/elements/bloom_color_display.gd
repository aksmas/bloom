extends Node2D


@onready var icon: Node2D = $BloomCount
@onready var tulips: Node2D = $TulipCount


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
	icon.cost = count
	tulips.count = count


func _update_color() -> void:
	icon.color = color
	tulips.color = color


func _ready() -> void:
	_update_count()
	_update_color()
