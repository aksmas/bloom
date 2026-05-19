extends ColorRect

@onready var cost_displays := [$PlantCost0, $PlantCost1, $PlantCost2, $PlantCost3] 

var PLANT: PlantCore
var ID: int

signal plant_selected(id: int)


func setup(id: int):
	ID = id


func update_cost_displays() -> void:
	var costs := PLANT.COST.to_array_tuple()
	costs.sort_custom(func(a, b): return a[0] > b[0])
	for i in range(cost_displays.size()):
		cost_displays[i].update(costs[i][0], costs[i][1])


func update(plant: PlantCore) -> void:
	PLANT = plant
	color = CoreConstants.BaseColors[PLANT.COLOR]
	update_cost_displays()


func sig_plant_selected() -> void:
	plant_selected.emit(ID)
