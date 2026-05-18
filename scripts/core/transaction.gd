class_name TransactionCore

var PLAYER: PlayerCore
var PLANT: PlantCore
var FOREST: ForestCore

var plants_used: VectorColors
var flowers_used: VectorColors
var wilds_used: int


func _init(player: PlayerCore, plant: PlantCore, forest: ForestCore) -> void:
	PLAYER = player
	PLANT = plant
	FOREST = forest


func valid() -> bool:
	plants_used = PLANT.COST.minima(PLAYER.plants.count_vector())
	var flower_balance := PLANT.COST.sub(plants_used)
	flowers_used = flower_balance.minima(PLAYER.flowers)
	wilds_used = flower_balance.sub(flowers_used).count()
	return PLAYER.wilds >= wilds_used


func execute() -> void:
	PLAYER.plants.add(PLANT)
	PLAYER.flowers = PLAYER.flowers.sub(flowers_used)
	PLAYER.wilds -= wilds_used
	FOREST.FLOWERS = FOREST.FLOWERS.add(flowers_used)
	FOREST.WILDS += wilds_used
