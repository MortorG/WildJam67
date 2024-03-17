extends Node2D

const max_sprite: int = 5
const wait_time: int = 1

@onready var timer: Timer = $Timer
@onready var sprite: Sprite2D = $Sprite

var owner_character: Node2D


func show_bar(_previuos: int, health: int, max_health: int) -> void:
	sprite.frame = (int)(max_sprite * health / max_health)
	visible = true
	timer.start(wait_time)


func _on_timer_timeout() -> void:
	visible = false


func _ready() -> void:
	visible = false


func _process(_delta) -> void:
	if !is_instance_valid(owner_character):
		queue_free()
		return
	if !visible: return
	
	global_position = owner_character.global_position

