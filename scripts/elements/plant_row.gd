extends PlantArrayNode

const sparse_spacing := 25
const dense_spacing := 20
const icon := preload("res://scenes/info/plant/plant_icon.tscn")

var children: Array[PlantNode] = []


func _delete_children() -> void:
	for child in children:
		child.queue_free()
	children.clear()


func _render_plant(plant: int) -> void:
	var scene: PlantNode = icon.instantiate()
	children.append(scene)
	add_child(scene)
	scene.plant_id = plant


func _update_spacing() -> void:
	var spacing := dense_spacing if children.size() > 6 else sparse_spacing
	for i in range(children.size()):
		children[i].position.x = i * spacing


func _update() -> void:
	_delete_children()
	for plant in plants:
		_render_plant(plant)
	_update_spacing()
