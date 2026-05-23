extends PlantArrayNode

@onready var icon: BloomColorCount = $BloomShapeCount
@onready var row: PlantArrayNode = $PlantRow

@export var color: Constants.BloomColor:
	set(value):
		color = value
		if is_node_ready():
			_update()


func _update() -> void:
	icon.color = color
	icon.count = plants.size()
	row.plants = plants
