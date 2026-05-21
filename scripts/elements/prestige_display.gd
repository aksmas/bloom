extends Sprite2D

@onready var displays: Array[Sprite2D] = [
	$Star1, $Star2, $Star3, $Star4, $Star5
]

@export var stars: int:
	set(value):
		stars = value
		if is_node_ready():
			_update()


func _update_displays(v1:bool, v2:bool, v3:bool, v4:bool, v5:bool) -> void:
	show()
	displays[0].visible = v1
	displays[1].visible = v2
	displays[2].visible = v3
	displays[3].visible = v4
	displays[4].visible = v5


func _update() -> void:
	match stars:
		1: _update_displays(false, false, true, false, false)
		2: _update_displays(false, true, false, true, false)
		3: _update_displays(true, false, true, false, true)
		4: _update_displays(true, true, false, true, true)
		5: _update_displays(true, true, true, true, true)
		_: hide()

func _ready() -> void:
	_update()
