extends BloomColorCount

@onready var label: Label = $CountLabel
@onready var bg: BloomColor = $BloomIcon


func _update_count() -> void:
	visible = count > 0
	label.text = str(count)


func _update_color() -> void:
	bg.color = color
	label.label_settings.font_color = Constants.FontColors[color]


func _setup() -> void:
	label.label_settings = LabelSettings.new()
	label.label_settings.font_size = 40
