extends State

@export var player : CharacterBody2D
@export var anim : AnimatedSprite2D
@export var projectile : PackedScene
@export var shootpos : Node2D
@export var sound_player: Node2D

func enter():
	player.velocity = Vector2.ZERO
	anim.play("shoot")
	$ShootDelayTimer.start()
	await anim.animation_finished
	transition.emit(self, "idle")

func _on_shoot_delay_timer_timeout():
	sound_player.play_sound("shoot")
	
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.look_at(dir + player.global_position)
	
	var s : Area2D = projectile.instantiate()
	s.position = shootpos.global_position
	s.rotation = shootpos.global_rotation
	owner.get_parent().add_child(s)
	s.set_meta("creator", owner)

