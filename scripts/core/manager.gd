class_name GameManagerCore extends Node2D

var num_players: int
var _turn_butterfly_visits: Array[int]

var status := CoreConstants.GameState.LOBBY
var current_player: int = 0
var shops: Array[ShopCore] = [ShopCore.new(0), ShopCore.new(1), ShopCore.new(2)]
var forest := ForestCore.new()
var players: Array[PlayerCore] = []


func add_player(player: PlayerCore) -> bool:
	if players.size() >= 4:
		return false
	players.append(player)
	return true


func start() -> bool:
	if players.size() < 2:
		return false
	num_players = players.size()
	players.shuffle()
	forest.start(num_players)
	for shop in shops:
		shop.start(num_players)
	status = CoreConstants.GameState.LIVE
	return true


func _next_player() -> void:
	current_player = (current_player + 1) % num_players


func _load_butterfly_visits() -> void:
	for idx in range(forest.BUTTERFLIES.size()):
		if forest.BUTTERFLIES[idx].pre_requisite_met(players[current_player].plants):
			_turn_butterfly_visits.append(idx)


func end_turn(butterfly_id: int = -1) -> bool:
	if butterfly_id > -1:
		if butterfly_id >= _turn_butterfly_visits.size():
			return false
		var butterfly := forest.BUTTERFLIES[_turn_butterfly_visits[butterfly_id]]
		forest.remove_butterfly(_turn_butterfly_visits[butterfly_id])
		players[current_player].add_butterfly(butterfly)
	_turn_butterfly_visits.clear()
	_next_player()
	return true


func _valid_shop_params(shop_id: int, plant_id: int) -> bool:
	if shop_id < 0 or shop_id >= shops.size() or plant_id < 0 or plant_id >= shops[shop_id].sale_count:
		return false
	return true


func _take_shop_action(shop_id: int, plant_id: int) -> bool:
	if not _valid_shop_params(shop_id, plant_id):
		return false
	var plant := shops[shop_id].sale[plant_id]
	var transaction := TransactionCore.new(players[current_player], plant, forest)
	if transaction.valid() and shops[shop_id].purchase(plant_id):
		transaction.execute()
		_load_butterfly_visits()
		return true
	return false


func _take_forage_action(
	color1: CoreConstants.BloomColor, 
	color2: CoreConstants.BloomColor,
	color3: CoreConstants.BloomColor
) -> bool:
	if (color1 != -1 and color2 == -1 and color3 == -1):
		if forest.take_2_same(color1):
			players[current_player].flowers.increment(color1, 2)
			return true
	if (color1 != -1 and color2 != -1 and color3 != -1):
		if forest.take_3_diff(color1, color2, color3):
			players[current_player].flowers.increment(color1)
			players[current_player].flowers.increment(color2)
			players[current_player].flowers.increment(color3)
			return true
	return false


func _take_wild_action(shop_id: int, plant_id: int) -> bool:
	if not (_valid_shop_params(shop_id, plant_id) and forest.WILDS > 0):
		return false
	players[current_player].reserves.append(shops[shop_id].sale[plant_id])
	forest.WILDS -= 1
	players[current_player].wilds += 1
	return true


func _take_grow_action(plant_id: int) -> bool:
	if plant_id < 0 or plant_id >= players[current_player].reserves.size():
		return false
	var plant := players[current_player].reserves[plant_id]
	var transaction := TransactionCore.new(players[current_player], plant, forest)
	if transaction.valid():
		players[current_player].reserves.remove_at(plant_id)
		transaction.execute()
		_load_butterfly_visits()
		return true
	return false


@warning_ignore("int_as_enum_without_cast")
@warning_ignore("int_as_enum_without_match")
func take_action(
	action: CoreConstants.Action,
	shop_id: int = -1, plant_id: int = -1,
	color1: CoreConstants.BloomColor = -1,
	color2: CoreConstants.BloomColor = -1,
	color3: CoreConstants.BloomColor = -1,
) -> bool:
	match action:
		CoreConstants.Action.SHOP:
			return _take_shop_action(shop_id, plant_id)
		CoreConstants.Action.FORAGE:
			return _take_forage_action(color1, color2, color3)
		CoreConstants.Action.WILD:
			return _take_wild_action(shop_id, plant_id)
		CoreConstants.Action.GROW:
			return _take_grow_action(plant_id)
	return false
