extends ColorRect

var PLAYER: PlayerCore


func _update_reserves() -> void:
	var plants_count := VectorColors.new()
	for plant in PLAYER.reserves:
		plants_count.increment(plant.COLOR)
	$Info/White/ReservesLabel.text = str(plants_count.WHITE)
	$Info/Red/ReservesLabel.text = str(plants_count.RED)
	$Info/Pink/ReservesLabel.text = str(plants_count.PINK)
	$Info/Purple/ReservesLabel.text = str(plants_count.PURPLE)
	$Info/Yellow/ReservesLabel.text = str(plants_count.YELLOW)


func _update_plants() -> void:
	var plants_count := PLAYER.plants.count_vector()
	$Info/White/PlantLabel.text = str(plants_count.WHITE)
	$Info/Red/PlantLabel.text = str(plants_count.RED)
	$Info/Pink/PlantLabel.text = str(plants_count.PINK)
	$Info/Purple/PlantLabel.text = str(plants_count.PURPLE)
	$Info/Yellow/PlantLabel.text = str(plants_count.YELLOW)


func _update_flowers() -> void:
	$Info/White/FlowerLabel.text = str(PLAYER.flowers.WHITE)
	$Info/Red/FlowerLabel.text = str(PLAYER.flowers.RED)
	$Info/Pink/FlowerLabel.text = str(PLAYER.flowers.PINK)
	$Info/Purple/FlowerLabel.text = str(PLAYER.flowers.PURPLE)
	$Info/Yellow/FlowerLabel.text = str(PLAYER.flowers.YELLOW)
	$Info/Wild/FlowerLabel.text = str(PLAYER.wilds)


func update(player: PlayerCore) -> void:
	PLAYER = player
	$NameLabel.text = PLAYER.NAME
	$ButterflyLabel.text = "Butterflies: %d" % PLAYER.butterflies.size()
	$PrestigeLabel.text = "Prestige: %d" % PLAYER.prestige()
	_update_flowers()
	_update_plants()
	_update_reserves()
