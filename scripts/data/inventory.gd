class_name InventoryData

var tulips := Vector5i.new()
var plants := VectorPlants.new()
var wilds := 0
var reserves: Array[PlantData] = []
var butterflies: Array[ButterflyData] = []


func prestige() -> int:
	var ret := plants.prestige()
	for butterfly in butterflies:
		ret += butterfly.prestige
	return ret
