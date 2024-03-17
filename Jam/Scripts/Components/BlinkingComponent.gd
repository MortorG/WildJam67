extends Node

@export var sprite : CanvasItem
@export var time_between_blink : float
@export var blink_opacity : float = 0.5

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
		sprite.self_modulate.a = blink_opacity
	else:
		sprite.self_modulate.a = 1.0
	blink = !blink
