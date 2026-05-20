extends Label

var SHOP: ShopCore

@onready var plant_displays := [$Plant0, $Plant1, $Plant2, $Plant3, $Plant4]

signal plant_selected(shop_id: int, plant_id: int)


func _hide_plants() -> void:
	for plant in plant_displays:
		plant.hide()


func update() -> void:
	_hide_plants()
	for i in range(SHOP.sale_count):
		plant_displays[i].update(SHOP.sale[i])
		plant_displays[i].show()


func setup_display_plants() -> void:
	_hide_plants()
	for i in range(SHOP.sale_count):
		plant_displays[i].show()
		plant_displays[i].setup(i)


func setup(shop: ShopCore) -> void:
	SHOP = shop
	$BackGround.color = CoreConstants.TIER_COLORS[shop.TIER]
	$BackGround.color.a = 0.5
	text = "Shop %d" % (shop.TIER + 1)
	setup_display_plants()
	update()


func sig_plant_selected(plant_id: int) -> void:
	plant_selected.emit(SHOP.TIER, plant_id)
