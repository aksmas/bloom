extends PlantNode

@onready var shape: BloomColor = $BloomShape
@onready var prestige: BloomColorCount = $PrestigeCount
@onready var title: Label = $NameLabel
@onready var desc: Label = $DescLabel
@onready var cost: PlantNode = $PlantCost


func _update_plant() -> void:
	shape.color = plant.color
	prestige.count = plant.prestige
	desc.text = plant.description
	cost.plant_id = plant_id
	title.text = (
		Constants.BloomColor.keys()[plant.color].to_upper()
		+ "\n" + plant.name.to_upper()
	)
