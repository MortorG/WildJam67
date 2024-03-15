extends State

@export var player : CharacterBody2D
@export var anim : AnimatedSprite2D
@export var unlocks : Unlocks

@export var speed: float
@export var accel : float

func physics_update(delta):
	if Input.is_action_pressed("shoot") && unlocks.can_shoot:
		transition.emit(self, "shoot")
	elif Input.is_action_pressed("slash"):
		transition.emit(self, "slash")
	else:
		var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		player.velocity = player.velocity.lerp(dir * speed, accel * delta)
		if dir.length_squared() == 0:
			transition.emit(self, "idle")
		else:
			player.move_and_slide()
			player.look_at(dir + player.global_position)

func enter():
	anim.play("move")
