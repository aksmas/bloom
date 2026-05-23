extends BloomColorCount

@onready var label: Label = $CountLabel
@onready var bg: BloomColor = $BloomShape

var spacing: float = 5.

@export var fill_mode: bool:
	set(value):
		fill_mode = value
		if is_node_ready():
			bg.fill_mode = fill_mode
			_update_color()


func _update_count() -> void:
	visible = count > 0
	label.text = str(count)


func _update_color() -> void:
	bg.color = color
	label.label_settings.font_color = (
		Constants.FontColors[color] if fill_mode else Constants.BGColors[color]
	)
	label.position.y = (
		spacing if color in 
		[Constants.BloomColor.WHITE, Constants.BloomColor.PINK] 
		else 0.
	)


func _setup() -> void:
	label.label_settings = LabelSettings.new()
	label.label_settings.font_size = 40
	bg.fill_mode = fill_mode
