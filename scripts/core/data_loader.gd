extends Node

var _plants: Array[Array] = [[], [], []]
var butterflies: Array[ButterflyInfo] = []


func _load_csv(
	path: String, 
	instantiator: Callable = func(values): return values
) -> Array:
	var data = []
	var file = FileAccess.open(path, FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		var values = line.split(",")
		data.append(instantiator.call(values))
	file.close()
	return data


func _load_plant(info: Array[String]) -> PlantInfo:
	return PlantInfo.new(
		info[0].to_int(), info[1], info[2].to_int(), info[4], info[3].to_int(), 
		Vector5i.new(info[6].to_int(), info[5].to_int(), info[8].to_int(), info[9].to_int(), info[7].to_int())
	)


func _load_butterfly(info: Array[String]) -> ButterflyInfo:
	return ButterflyInfo.new(
		info[0].to_int(), info[1], info[2], 
		Vector5i.new(info[4].to_int(), info[3].to_int(), info[6].to_int(), info[7].to_int(), info[5].to_int())
	)


func _ready():
	_plants[0] = _load_csv("res://data/plants_tier_1.csv", _load_plant)
	_plants[1] = _load_csv("res://data/plants_tier_2.csv", _load_plant)
	_plants[2] = _load_csv("res://data/plants_tier_3.csv", _load_plant)
	butterflies = _load_csv("res://data/butterflies.csv", _load_butterfly)


func plants(tier: int) -> Array[PlantInfo]:
	return _plants[tier]
