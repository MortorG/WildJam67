extends Area2D

func _ready():
	$Timer.start()

func _on_timer_timeout():
	self.queue_free()

func _on_body_entered(body):
	var health : HealthComponent = body.get_node_or_null("HealthComponent")
	if health == null:
		return
	health.damage(1)
