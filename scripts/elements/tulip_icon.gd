extends Sprite2D

var textures :Array[Resource] = [
	preload("res://assets/icons/tulip_icon.svg"),
	preload("res://assets/icons/tulip_icon_parrot.svg"),
]

@export var color: Constants.BloomColor:
	set(value):
		color = value
		if is_node_ready():
			_update()


func _update() -> void:
	if color == Constants.BloomColor.WILD:
		texture = textures[1]
		modulate = Color.WHITE
	else:
		texture = textures[0]
		modulate = Constants.BGColors[color]


func _ready() -> void:
	_update()
