extends State

@export var anim : AnimatedSprite2D
@export var projectile : PackedScene
@export var shootpos : Node2D

func enter():
	anim.play("shoot")
	$Timer.start()
	var s : Area2D = projectile.instantiate()
	get_parent().get_parent().get_parent().add_child(s)
	s.position = shootpos.global_position
	s.rotation = shootpos.global_rotation
	
func _on_timer_timeout():
	transition.emit(self, "idle")
