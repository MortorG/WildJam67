extends State

@export var enemy : Enemy
@export var anim : AnimatedSprite2D

func enter():
	anim.play("move")

func physics_update(_delta):
	var max_speed := 50
	if enemy.linear_velocity.length_squared() > max_speed * max_speed:
		enemy.linear_velocity = enemy.linear_velocity.normalized() * max_speed

func on_hit():
	var knockback := 60
	enemy.apply_impulse((enemy.global_position - enemy.player.global_position).normalized() * knockback, Vector2.ZERO)

func die():
	transition.emit(self, "dying")

func _on_health_component_on_damage(_prev, _cur, _max):
	on_hit()

func _on_health_component_on_zero(_prev, _cur, _max):
	die()
