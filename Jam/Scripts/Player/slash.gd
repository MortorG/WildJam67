extends Area2D

func _ready():
	$Timer.start()

func _on_timer_timeout():
	self.queue_free()

func _on_body_entered(_body):
	pass # DEAL DAMAGE
