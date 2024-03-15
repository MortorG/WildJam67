extends Node

@export var sprite : CanvasItem
@export var time_between_blink : float

var blink : bool = true

func _ready():
	$Blink_time.set_wait_time(time_between_blink)

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
