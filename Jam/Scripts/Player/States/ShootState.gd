extends State

@export var player : CharacterBody2D
@export var anim : AnimatedSprite2D
@export var projectile : PackedScene
@export var shootpos : Node2D

func enter():	
	player.velocity = Vector2.ZERO
	anim.play("shoot")
	$ShootDelayTimer.start()
	await anim.animation_finished
	transition.emit(self, "idle")

func _on_shoot_delay_timer_timeout():
	var s : Area2D = projectile.instantiate()
	s.position = shootpos.global_position
	s.rotation = shootpos.global_rotation
	get_parent().get_parent().get_parent().add_child(s)
	s.set_meta("creator", owner)

