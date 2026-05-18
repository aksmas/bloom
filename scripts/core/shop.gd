class_name ShopCore

var TIER: int

var sale_count: int
var sale_pointer: int = 0
var plants: Array[PlantCore] = []
var sale: Array[PlantCore] = []


func _assert_plants_loaded(num: int) -> void:
	assert(plants.size() == num)
	for color in CoreConstants.BloomColor:
		var count := 0
		for plant in plants:
			if plant.color == color:
				count += 1
		assert(count == num / 5)


func _init_plants() -> void:
	# Placeholder for plant initialization logic
	_assert_plants_loaded(CoreConstants.TIER_PLANTS[TIER])


func _init_sale() -> void:
	for i in range(sale_count):
		sale.append(plants[i])


func _init(tier: int, players: int) -> void:
	TIER = tier
	_init_plants()
	sale_count = players + 1
	_init_sale()
	sale_pointer = sale_count


func purchase(idx: int) -> PlantCore:
	assert(idx < sale_count)
	var plant := sale[idx]
	if sale_pointer < CoreConstants.TIER_PLANTS[TIER]:
		sale[idx] = plants[sale_pointer]
		sale_pointer += 1
	else:
		sale.remove_at(idx)
		sale_count -= 1
	return plant
	