extends Node2D
class_name OneOffButton
signal button_pressed

var activated : bool = false

func _on_hit(prev, cur, max):
	activated = true
	button_pressed.emit()
