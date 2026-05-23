class_name PlantNode
extends Node2D

var plant: PlantData

@export var plant_id: int:
	set(value):
		plant_id = value
		if is_node_ready():
			_update()


func _update_color() -> void:
	pass


func _update_count() -> void:
	pass


func _update() -> void:
	plant = DataLoader.plant(plant_id)
	_update_color()
	_update_count()


func _setup() -> void:
	pass


func _ready() -> void:
	_setup()
	_update()
