class_name PlantData

var id: int
var name: String
var description: String
var color: Constants.BloomColor
var prestige: int
var cost: Vector5i

func _init(
	_id: int, _name: String, _color: Constants.BloomColor,
	_description: String, _prestige: int, _cost: Vector5i
) -> void:
	id = _id
	name = _name
	description = _description
	color = _color
	prestige = _prestige
	cost = _cost
