extends State

@export var player : CharacterBody2D
@export var anim : AnimatedSprite2D
@export var slash : PackedScene
@export var slashpos : Node2D
@export var sound_player: SoundsPlayer

var is_right_arm = true

func enter():
	if !is_right_arm:
		anim.flip_h = true
	player.velocity = Vector2.ZERO
	anim.play("slash")
	$AttackDelayTimer.start()
	await anim.animation_finished
	transition.emit(self, "idle")

func exit():
	anim.flip_h = false
	is_right_arm = !is_right_arm

func _on_attack_delay_timer_timeout():
	sound_player.play_sound("slash")
	
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.look_at(dir + player.global_position)
	
	var s : Area2D = slash.instantiate()
	get_parent().get_parent().get_parent().add_child(s)
	s.position = slashpos.global_position
	s.rotation = slashpos.global_rotation
	s.set_meta("creator", owner)
