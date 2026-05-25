extends BloomColorCount

@onready var label: Label = $CountLabel

func _update_count() -> void: 
	label.text = str(count)
	visible = count > 0
