extends Area2D

@export var is_active: bool = false
@export var camera: Camera2D

@onready var move_pos = $pos

const move_speed = 200
const close_distance = 1


func set_active():
	is_active = true


func _ready():
	set_process(false)


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	set_process(true)


func _process(delta: float) -> void:
	var target = move_pos.global_position
	if camera.global_position.distance_to(target) > close_distance:
		var dir = target - camera.global_position
		dir = dir.normalized()
		camera.translate(dir * move_speed * delta)
	else:
		set_process(false)
