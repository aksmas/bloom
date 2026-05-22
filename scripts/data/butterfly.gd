class_name ButterflyInfo

var id: int
var name: String
var description: String
var requirements: Vector5i
var prestige: int

func _init(
	_id: int, _name: String, _description: String, 
	_requirements: Vector5i, _prestige: int = 3
) -> void:
	id = _id
	name = _name
	description = _description
	requirements = _requirements
	prestige = _prestige
