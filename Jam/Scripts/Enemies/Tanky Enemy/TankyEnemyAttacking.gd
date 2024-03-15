extends State

@export var anim : AnimatedSprite2D
@export var attack_hitbox : Array[CollisionShape2D]

func enter():
	anim.play("buildup")
	$Buildup.start()

func _on_buildup_timeout():
	anim.play("attack")
	for i in attack_hitbox:
		i.set_deferred("disabled", false)
	$AttackDuration.start()

func _on_attack_duration_timeout():
	for i in attack_hitbox:
		i.set_deferred("disabled", true)
	$Endlag.start()

func _on_endlag_timeout():
	transition.emit(self, "active")

func _on_health_component_on_zero(_prev, _cur, _max):
	transition.emit(self, "dying")
