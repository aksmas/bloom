extends BloomColorCount

@onready var tulips: Array[BloomColor] = [
	$TulipIcon0, $TulipIcon1, $TulipIcon2, $TulipIcon3,
]


func _update_count() -> void:
	for i in range(tulips.size()):
		tulips[i].visible = i < count


func _update_color() -> void:
	for tulip in tulips:
		tulip.color = color
