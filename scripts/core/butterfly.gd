class_name ButterflyCore

var NAME: String
var PREREQUISITES: VectorColors
var DESCRIPTION: String

const PRESTIGE := 3


func _init(name: String, prerequisites: VectorColors, description: String) -> void:
	NAME = name
	PREREQUISITES = prerequisites
	DESCRIPTION = description


func pre_requisite_met(plants: VectorColoredPlants) -> bool:
	return plants.count_vector().sub(PREREQUISITES).is_positive()
