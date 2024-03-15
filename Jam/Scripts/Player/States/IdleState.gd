extends State

@export var anim : AnimatedSprite2D
@export var player : CharacterBody2D
@export var unlocks : Unlocks

func physics_update(delta):
	if Input.is_action_pressed("shoot") && unlocks.can_shoot:
		transition.emit(self, "shoot")
	elif Input.is_action_pressed("slash"):
		transition.emit(self, "slash")
	else:
		var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		player.velocity = player.velocity.lerp(Vector2.ZERO, 20 * delta)
		player.move_and_slide()
		if dir.length_squared() > 0:
			transition.emit(self, "moving")

func enter():
	anim.play("idle")
