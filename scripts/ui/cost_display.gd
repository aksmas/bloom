extends ColorRect


func _ready() -> void:
	$AmountLabel.label_settings = LabelSettings.new()


func update(cost: int, p_color: CoreConstants.BloomColor) -> void:
	if cost == 0:
		hide()
		return
	show()
	self.color = CoreConstants.BaseColors[p_color]
	$AmountLabel.text = str(cost)
	$AmountLabel.label_settings.font_color = CoreConstants.FontColors[p_color]
