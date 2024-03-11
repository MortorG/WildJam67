extends State

@export var anim : AnimatedSprite2D
@export var attack_hitbox : CollisionShape2D

func enter():
	anim.play("attack")
	$Buildup.start()

func _on_buildup_timeout():
	attack_hitbox.set_deferred("disabled", false)
	$AttackDuration.start()

func _on_attack_duration_timeout():
	attack_hitbox.set_deferred("disabled", true)
	$Endlag.start()

func _on_endlag_timeout():
	transition.emit(self, "active")

func _on_health_component_on_zero(_prev, _cur, _max):
	transition.emit(self, "dying")
