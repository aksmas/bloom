extends BloomColorCount

var spacing := 25

@onready var row1: BloomColor = $TulipRow1
@onready var row2: BloomColor = $TulipRow2


func _update_count() -> void:
	@warning_ignore("integer_division")
	var q := count/2
	var r := count%2
	row1.count = q + r
	row2.count = q
	row1.position.y = 0 if count == 1 else -spacing
	row2.position.x = spacing * r


func _update_color() -> void:
	row1.color = color
	row2.color = color
