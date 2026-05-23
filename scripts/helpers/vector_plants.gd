class_name VectorPlants

var _plants: Array[Array]


func _init() -> void:
	_plants = [[], [], [], [], []]


func add(plant: PlantData) -> void:
	_plants[plant.color].append(plant)


func read(color: Constants.BloomColor) -> Array[PlantData]:
	return _plants[color]


func vector() -> Vector5i:
	var result := Vector5i.new()
	for i in range(5):
		result.write(i, read(i).size())
	return result


func prestige() -> int:
	var ret := 0
	for color in _plants:
		for plant: PlantData in color:
			ret += plant.prestige
	return ret
