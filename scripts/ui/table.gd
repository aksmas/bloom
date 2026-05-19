extends Panel

@onready var manager: GameManagerCore = $".."
@onready var shop_displays:= [$Shop0, $Shop1, $Shop2]


func _ready() -> void:
	hide()


func setup() -> void:
	for i in range(shop_displays.size()):
		shop_displays[i].setup(manager.shops[i])
	show()
