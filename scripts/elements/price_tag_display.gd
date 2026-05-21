extends Node2D

@onready var displays: Array[Node2D] = [
	$CostDisplay0, $CostDisplay1, $CostDisplay2, $CostDisplay3, $CostDisplay4
] 

var plant: PlantInfo
var spacing := 64

@export var plant_id: int:
	set(value):
		plant_id = value
		if is_node_ready():
			_update()


func _sort_displays() -> void:
	var i := 0
	for display in displays:
		if display.visible:
			display.position.y = i * spacing
			i += 1


func _update() -> void:
	plant = DataLoader.plant(plant_id)
	for color in Constants.BloomColor.values():
		displays[color].cost = plant.cost.read(color)
	_sort_displays()


func _ready() -> void:
	_update()
