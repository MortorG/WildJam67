extends ColorRect

class_name MenuBase


@onready
var options: ColorRect = get_node("../Options")

func set_options_visible() -> void:
	options.visible = true
