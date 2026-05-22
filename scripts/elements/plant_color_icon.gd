extends BloomColor

@onready var icon: Sprite2D = $Icon

func _update_color() -> void:
	icon.self_modulate = Constants.BGColors[color]
