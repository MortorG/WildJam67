extends State

@export var anim : AnimatedSprite2D

func physics_update(_delta):
	if Input.is_action_pressed("slash"):
		transition.emit(self, "slash")
		pass
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if dir.length_squared() > 0:
		transition.emit(self, "moving")
		pass

func enter():
	anim.play("idle")
