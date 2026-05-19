class_name ForestCore

const _BUTTERFLIES_CSV := "res://data/butterflies.csv"

var FLOWERS: VectorColors
var WILDS: int
var ALL_BUTTERFLIES: Array[ButterflyCore] = []
var BUTTERFLIES: Array[ButterflyCore] = []


func _init() -> void:
	var file := FileAccess.open(_BUTTERFLIES_CSV, FileAccess.READ)
	file.get_csv_line()
	while not file.eof_reached():
		var row := file.get_csv_line()
		var prereq := VectorColors.new(
			int(row[2]), int(row[3]), int(row[4]), int(row[5]), int(row[6])
		)
		ALL_BUTTERFLIES.append(ButterflyCore.new(row[0], prereq, row[1]))


func start(players: int) -> void:
	var num := players + 3
	FLOWERS = VectorColors.new(num, num, num, num, num)
	WILDS = players + 1
	ALL_BUTTERFLIES.shuffle()
	BUTTERFLIES = ALL_BUTTERFLIES.slice(0, players + 1)


func take_wild() -> bool:
	if WILDS <= 0:
		return false
	WILDS -= 1
	return true


func take_2_same(color: CoreConstants.BloomColor) -> bool:
	var count := FLOWERS.read(color)
	if count < 4:
		return false
	FLOWERS.increment(color, -2)
	return true


func take_3_diff(
	color1: CoreConstants.BloomColor, 
	color2: CoreConstants.BloomColor, 
	color3: CoreConstants.BloomColor
) -> bool:
	if (color1 == color2) or (color2 == color3) or (color1 == color3):
		return false
	var colors: Array[CoreConstants.BloomColor] = [color1, color2, color3]
	for color in colors:
		if FLOWERS.read(color) <= 0:
			return false
	for color in colors:
		FLOWERS.increment(color, -1)
	return true


func add_flowers(flowers: VectorColors, wilds: int) -> void:
	WILDS += wilds
	FLOWERS = FLOWERS.add(flowers)


func remove_butterfly(idx: int) -> void:
	BUTTERFLIES.remove_at(idx)
