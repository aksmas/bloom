class_name PlantCore

var ID: int
var NAME: String
var TIER: int
var COLOR: CoreConstants.BloomColor
var COST: VectorColors
var PRESTIGE: int
var DESCRIPTION: String


func _init(
	id: int, name: String, tier: int, 
	color: CoreConstants.BloomColor, 
	cost: VectorColors, prestige: int, desc: String
) -> void:
	ID = id
	NAME = name
	TIER = tier
	COLOR = color
	COST = cost
	PRESTIGE = prestige
	DESCRIPTION = desc
