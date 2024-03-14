extends MenuBase

@onready var confirm_window = get_node("../Confirm")


func _on_continue_pressed() -> void:
	get_tree().paused = false
	change_visible(false)


func _on_options_pressed() -> void:
	set_options_visible()


func _on_try_quit_pressed() -> void:
	confirm_window.visible = true


func _on_back_pressed():
	confirm_window.visible = false


func _on_quit_pressed() -> void:
	get_tree().paused = false
	G.levels.change_level(Enums.Levels.menu)


func _process(_delta) -> void:
	if Input.is_action_just_pressed("pause"):
		change_visible(!get_visible())
		get_tree().paused = get_visible()


func change_visible(value: bool) -> void:
	get_parent().visible = value


func get_visible() -> bool:
	return get_parent().visible
