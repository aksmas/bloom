extends PlantNode

const spacing := 64

@onready var displays: Array[Node2D] = [
	$CostDisplay0, $CostDisplay1, $CostDisplay2, $CostDisplay3, $CostDisplay4
]


func _sort_displays() -> void:
	var i := 0
	for display in displays:
		if display.visible:
			display.position.x = i * spacing
			i += 1


func _update_plant() -> void:
	for color in Constants.BloomColor.values():
		if color != Constants.BloomColor.WILD:
			displays[color].count = plant.cost.read(color)
	_sort_displays()
