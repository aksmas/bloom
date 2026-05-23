class_name PlantArrayNode
extends Bloom2D

@export var plants: Array[int]: 
	set(value): 
		plants = value
		if is_node_ready():
			_update()
