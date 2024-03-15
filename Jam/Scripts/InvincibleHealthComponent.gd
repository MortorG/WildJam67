extends HealthComponent

@export var hitboxes : Array[CollisionShape2D]

signal on_invincible_start
signal on_invincible_end

func _process(delta):
	pass

func invincible_start(_1, _2, _3):
	for item in hitboxes:
		item.set_deferred("disabled", true)
	$Invincible_duration.start()
	on_invincible_start.emit()

func _on_invincible_duration_timeout():
	for item in hitboxes:
		item.set_deferred("disabled", false)
	hit_this_frame = false
	on_invincible_end.emit()
