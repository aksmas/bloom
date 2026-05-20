class_name ShopCore

var TIER: int
const _PLANTS_CSV := "res://data/tier%d_plants.csv"

var sale_count: int
var sale_pointer: int = 0
var plants: Array[PlantCore] = []
var sale: Array[PlantCore] = []


func _init_plants() -> void:
	var file := FileAccess.open(_PLANTS_CSV % (TIER+1), FileAccess.READ)
	file.get_csv_line()
	while not file.eof_reached():
		var row := file.get_csv_line()
		var color: CoreConstants.BloomColor = CoreConstants.BloomColor[row[1].to_upper()]
		var cost := VectorColors.new(
			int(row[4]), int(row[5]), int(row[6]), int(row[7]), int(row[8])
		)
		plants.append(PlantCore.new(
			plants.size(), row[0], TIER, color, cost, int(row[2]), row[3]
		))


func _init(tier: int) -> void:
	TIER = tier
	_init_plants()
	plants.shuffle()
	plants = plants.slice(0, 5)


func start(players: int) -> void:
	sale_count = players + 1
	for i in range(sale_count):
		sale.append(plants[i])
	sale_pointer = sale_count


func purchase(idx: int) -> bool:
	if idx < 0 or idx >= sale_count:
		return false
	if sale_pointer < 5:
		sale[idx] = plants[sale_pointer]
		sale_pointer += 1
	else:
		sale.remove_at(idx)
		sale_count -= 1
	return true
