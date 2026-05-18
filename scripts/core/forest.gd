class_name ForestCore

var FLOWERS: VectorColors
var WILDS: int
var BUTTERFLIES: Array[ButterflyCore]


func _init() -> void:
	BUTTERFLIES = []


func start(players: int) -> void:
	var num := players + 3
	FLOWERS = VectorColors.new(num, num, num, num, num)
	WILDS = players + 1


func take_wild() -> bool:
	if WILDS <= 0:
		return false
	WILDS -= 1
	return true


func take_2_same(color: CoreConstants.BloomColor) -> bool:
	var count := FLOWERS.read(color)
	if count < 4:
		return false
	FLOWERS.write(color, count - 2)
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
		FLOWERS.write(color, FLOWERS.read(color) - 1)
	return true


func add_flowers(flowers: VectorColors, wild_flowers: int) -> void:
	WILDS += wild_flowers
	FLOWERS = FLOWERS.add(flowers)


func remove_butterfly(idx: int) -> void:
	BUTTERFLIES.remove_at(idx)
