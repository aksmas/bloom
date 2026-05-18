class_name PlayerCore

var ID: int
var NAME: String

var flowers := VectorColors.new()
var wilds := 0
var plants := VectorColoredPlants.new()
var reserves: Array[PlantCore] = []
var butterflies: Array[ButterflyCore] = []


func prestige() -> int:
	var ret := plants.prestige()
	for butterfly in butterflies:
		ret += butterfly.prestige()
	return ret


func add_butterfly(butterfly: ButterflyCore) -> void:
	butterflies.append(butterfly)


func add_plant(plant: PlantCore) -> bool:
	var plant_balance := plants.count_vector().sub(plant.COST)
	var flower_balance := flowers.add(plant_balance)
	plants.add(plant)
	return true
