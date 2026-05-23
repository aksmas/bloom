extends BloomColorCount

@onready var shape: Node2D = $BloomShapeCount
@onready var elements: Node2D = $ElementCount


func _update_count() -> void:
	shape.count = count
	elements.count = count


func _update_color() -> void:
	shape.color = color
	elements.color = color
