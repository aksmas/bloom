extends Node2D

var spacing := 25
@onready var row1: Node2D = $TulipRow1
@onready var row2: Node2D = $TulipRow2


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
	@warning_ignore("integer_division")
	var q := count/2
	var r := count%2
	row1.count = q + r
	row2.count = q
	row1.position.y = 0 if count == 1 else -spacing
	row2.position.x = spacing * r


func _update_color() -> void:
	row1.color = color
	row2.color = color


func _ready() -> void:
	_update_count()
	_update_color()
