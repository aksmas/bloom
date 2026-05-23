extends PlantNode

@onready var icon: Sprite2D = $Icon

@export var wild := false:
	set(value):
		wild = value
		if is_node_ready():
			_update_color()


func _update_color() -> void:
	icon.self_modulate = (Constants.BGColors[Constants.BloomColor.WILD] 
							if wild else Constants.BGColors[plant.color])


func set_wild(value: bool) -> void:
	wild = value
