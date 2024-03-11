extends State

@export var anim : AnimatedSprite2D
@export var slash : PackedScene
@export var slashpos : Node2D

func enter():
	anim.play("slash")
	$Timer.start()
	var s : Area2D = slash.instantiate()
	get_parent().get_parent().get_parent().add_child(s)
	s.position = slashpos.global_position
	s.rotation = slashpos.global_rotation
	s.set_meta("creator", owner)
	
func _on_timer_timeout():
	transition.emit(self, "idle")
