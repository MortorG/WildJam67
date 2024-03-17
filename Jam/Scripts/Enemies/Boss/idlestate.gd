extends Alive_State

@export var anim : AnimatedSprite2D

func enter():
	anim.play("idle")
	$IdleDuration.start()

func _on_idle_duration_timeout():
	transition.emit(self, "summon")
