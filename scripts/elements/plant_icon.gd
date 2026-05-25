extends PlantNode

@onready var icon: Sprite2D = $Icon
@onready var tool_tip: PlantNode = $PlantToolTip

@export var wild := false:
	set(value):
		wild = value
		if is_node_ready():
			_update_plant()


func _update_plant() -> void:
	tool_tip.plant_id = plant_id
	icon.self_modulate = (Constants.BGColors[Constants.BloomColor.WILD] 
							if wild else Constants.BGColors[plant.color])


func set_wild(value: bool) -> void:
	wild = value
