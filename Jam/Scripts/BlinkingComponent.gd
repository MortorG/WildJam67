extends Node

@export var sprite : CanvasItem
var blink : bool = true

func start_blink():
	blink = true
	$Blink_time.start()
func end_blink():
	sprite.self_modulate.a = 1.0
	$Blink_time.stop()

func _blink():
	if blink:
		sprite.self_modulate.a = 0.5
	else:
		sprite.self_modulate.a = 1.0
	blink = !blink
