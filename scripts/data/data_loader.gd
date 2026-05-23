extends Node

var _plants: Array[Array] = [[], [], []]
var butterflies: Array[ButterflyInfo] = []


func _load_csv(
	path: String, 
	instantiator: Callable = func(values): return values
) -> Array:
	var data = []
	var file := FileAccess.open(path, FileAccess.READ)
	file.get_line()
	while not file.eof_reached():
		var line = file.get_line()
		var values = line.split(",")
		data.append(instantiator.call(values))
	file.close()
	return data


func _load_plant(info: Array[String]) -> PlantInfo:
	return PlantInfo.new(
		info[0].to_int(), info[1], Constants.BloomColor.get(info[2].to_upper()) ,
		info[4], info[3].to_int(), 
		Vector5i.new(info[6].to_int(), info[5].to_int(), info[8].to_int(), info[9].to_int(), info[7].to_int())
	)


func _load_butterfly(info: Array[String]) -> ButterflyInfo:
	return ButterflyInfo.new(
		info[0].to_int(), info[1], info[2], 
		Vector5i.new(info[4].to_int(), info[3].to_int(), info[6].to_int(), info[7].to_int(), info[5].to_int())
	)


func _ready():
	_plants[0] = _load_csv("res://data/tier1_plants.csv", _load_plant)
	_plants[1] = _load_csv("res://data/tier2_plants.csv", _load_plant)
	_plants[2] = _load_csv("res://data/tier3_plants.csv", _load_plant)
	butterflies.assign(_load_csv("res://data/butterflies.csv", _load_butterfly))


func tier_plants(tier: int) -> Array[PlantInfo]:
	return _plants[tier]


func plant(id: int) -> PlantInfo:
	@warning_ignore("integer_division")
	return _plants[(id/100)-1][(id%100)-1]


func butterfly(id: int) -> ButterflyInfo:
	return butterflies[id-1]
