class_name ButterflyCore

var NAME: String
var PREREQUISITES: VectorColors

const PRESTIGE := 3


func _init(name: String, prerequisites: VectorColors) -> void:
	NAME = name
	PREREQUISITES = prerequisites


func pre_requisite_met(plants: VectorColoredPlants) -> bool:
	return plants.count_vector().sub(PREREQUISITES).is_positive()
