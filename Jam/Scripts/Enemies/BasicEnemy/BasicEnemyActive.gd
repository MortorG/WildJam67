extends State

@export var enemy : Enemy
@export var anim : AnimatedSprite2D
@export var nav : NavigationAgent2D

@export var speed : float
@export var accel : float

func enter():
	anim.play("move")

func physics_update(delta):
	nav.target_position = enemy.player.global_position
	
	var move_dir = enemy.global_position.direction_to(nav.get_next_path_position())
	
	enemy.velocity = enemy.velocity.lerp(move_dir * speed, accel * delta)
	enemy.move_and_slide()

func die():
	transition.emit(self, "dying")

func _on_health_component_on_zero(_prev, _cur, _max):
	die()