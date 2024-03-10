extends State

@export var player : CharacterBody2D
@export var anim : AnimatedSprite2D

@export var speed: float

func physics_update(_delta):
	if Input.is_action_pressed("slash"):
		transition.emit(self, "slash")
	elif Input.is_action_pressed("shoot"):
		transition.emit(self, "shoot")
	else:
		var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if dir.length_squared() == 0:
			transition.emit(self, "idle")
		else:
			player.velocity = dir * speed
			player.move_and_slide()
			player.look_at(dir + player.global_position)

func enter():
	anim.play("move")
