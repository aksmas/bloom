class_name VectorColoredPlants

var WHITE: Array[PlantCore] = []
var RED: Array[PlantCore] = []
var PINK: Array[PlantCore] = []
var PURPLE: Array[PlantCore] = []
var YELLOW: Array[PlantCore] = []


func read(color: CoreConstants.BloomColor) -> Array[PlantCore]:
	match color:
		CoreConstants.BloomColor.WHITE: return WHITE
		CoreConstants.BloomColor.RED: return RED
		CoreConstants.BloomColor.PINK: return PINK
		CoreConstants.BloomColor.PURPLE: return PURPLE
		CoreConstants.BloomColor.YELLOW: return YELLOW
	push_error("VectorColoredPlants: invalid color %d" % color)
	return []


func count(color: CoreConstants.BloomColor) -> int:
	return read(color).size()


func add(plant: PlantCore) -> void:
	read(plant.COLOR).append(plant)


func count_vector() -> VectorColors:
	return VectorColors.new(
		WHITE.size(),
		RED.size(),
		PINK.size(),
		PURPLE.size(),
		YELLOW.size(),
	)


func prestige() -> int:
	var ret := 0
	for color in CoreConstants.BloomColor:
		for plant in read(color):
			ret += plant.prestige()
	return ret


func _to_string() -> String:
	return "VectorColoredPlants(W=%d, R=%d, P=%d, Pu=%d, Y=%d)" \
		% [WHITE.size(), RED.size(), PINK.size(), PURPLE.size(), YELLOW.size()]
