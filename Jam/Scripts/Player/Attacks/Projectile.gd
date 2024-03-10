extends Area2D

@export var speed : float

func _ready():
	$Timer.start()

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

func _on_timer_timeout():
	self.queue_free()


func _on_body_entered(body):
	var health : HealthComponent = body.get_node_or_null("HealthComponent")
	if health == null:
		return
	health.damage(1)
