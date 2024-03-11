extends Area2D

@export var speed : float
@export var attack_properties : AttackProperties

func _ready():
	$Timer.start()

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_timer_timeout():
	self.queue_free()	

func _on_area_entered(area):
	var health : HealthComponent = area.owner.get_node_or_null("HealthComponent")
	if health != null:
		health.damage(attack_properties.damage)
	var knockback : KnockbackComponent = area.owner.get_node_or_null("KnockbackComponent")
	if knockback != null:
		knockback.knock_back(Vector2.RIGHT.rotated(rotation), attack_properties.knockback)
	self.queue_free()

func _on_body_entered(_body):
	self.queue_free()
