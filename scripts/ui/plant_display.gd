extends ColorRect

@onready var cost_displays := [$PlantCost0, $PlantCost1, $PlantCost2, $PlantCost3] 

var PLANT: PlantCore
var ID: int

signal plant_selected(id: int)


func _ready() -> void:
	$PrestigeLabel.hide()
	$PrestigeLabel.label_settings = LabelSettings.new()
	$PrestigeLabel.label_settings.font_size = 29


func setup(id: int):
	ID = id


func _update_prestige_display() -> void:
	if PLANT.PRESTIGE > 0:
		$PrestigeLabel.text = str(PLANT.PRESTIGE)
		$PrestigeLabel.label_settings.font_color = CoreConstants.FontColors[PLANT.COLOR]
		$PrestigeLabel.show()
	else:
		$PrestigeLabel.hide()


func _update_cost_displays() -> void:
	var costs := PLANT.COST.to_array_tuple()
	costs.sort_custom(func(a, b): return a[0] > b[0])
	for i in range(cost_displays.size()):
		cost_displays[i].update(costs[i][0], costs[i][1])


func update(plant: PlantCore) -> void:
	PLANT = plant
	color = CoreConstants.BaseColors[PLANT.COLOR]
	_update_cost_displays()
	_update_prestige_display()


func sig_plant_selected() -> void:
	plant_selected.emit(ID)
