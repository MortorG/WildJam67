extends MenuBase


func _on_continue_pressed():
	get_tree().paused = false
	change_visible(false)


func _on_options_pressed():
	set_options_visible()


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Interface/main_menu.tscn")


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		change_visible(!get_visible())
		get_tree().paused = get_visible()


func change_visible(value: bool) -> void:
	get_parent().visible = value


func get_visible() -> bool:
	return get_parent().visible
