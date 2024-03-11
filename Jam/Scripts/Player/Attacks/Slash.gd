extends Area2D
@export var attack_properties : AttackProperties

func _ready():
	$Timer.start()

func _on_timer_timeout():
	self.queue_free()

func _on_area_entered(area):
	var health : HealthComponent = area.owner.get_node_or_null("HealthComponent")
	if health != null:
		health.damage(attack_properties.damage)
	var knockback : KnockbackComponent = area.owner.get_node_or_null("KnockbackComponent")
	if knockback != null:
		var origin = get_meta("creator") as Node2D
		knockback.knock_back(origin.global_position.direction_to(area.owner.global_position), attack_properties.knockback)
