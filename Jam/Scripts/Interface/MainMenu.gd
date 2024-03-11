extends MenuBase


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/game.tscn")


func _on_options_pressed():
	set_options_visible()


func _on_quit_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
