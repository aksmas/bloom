class_name PlayerCore

var ID: int
var NAME: String

var flowers := VectorColors.new()
var wilds := 0
var plants := VectorColoredPlants.new()
var reserves: Array[PlantCore] = []
var butterflies: Array[ButterflyCore] = []


func _init(id: int, name: String) -> void:
	ID = id
	NAME = name


func prestige() -> int:
	var ret := plants.prestige()
	for butterfly in butterflies:
		ret += butterfly.prestige()
	return ret


func add_butterfly(butterfly: ButterflyCore) -> void:
	butterflies.append(butterfly)

