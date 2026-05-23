extends BloomColor

const textures :Array[Resource] = [
	preload("res://assets/icons/tulip_icon.svg"),
	preload("res://assets/icons/tulip_icon_parrot.svg"),
]

@onready var icon: Sprite2D = $Icon


func _update_color() -> void:
	if color == Constants.BloomColor.WILD:
		icon.texture = textures[1]
		modulate = Color.WHITE
	else:
		icon.texture = textures[0]
		modulate = Constants.BGColors[color]
