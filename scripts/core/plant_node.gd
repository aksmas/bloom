class_name PlantNode
extends Bloom2D

var plant: PlantData

@export var plant_id: int:
	set(value):
		plant_id = value
		if is_node_ready():
			_update()


func _update_plant() -> void:
	pass


func _update() -> void:
	plant = DataLoader.plant(plant_id)
	_update_plant()
