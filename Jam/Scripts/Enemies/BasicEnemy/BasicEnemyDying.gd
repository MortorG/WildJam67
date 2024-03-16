extends State

@export var enemy : Enemy
@export var anim : AnimatedSprite2D
@export var hitboxes : Array[CollisionShape2D]
@export var timers : Array[Timer]

func enter():
	GS.play_enemy_die_sound()
	
	anim.play("die")
	for item in hitboxes:
		item.set_deferred("disabled", true)
	for item in timers:
		item.stop()
	enemy.velocity = Vector2.ZERO
	$Timer.start()

func die():
	enemy.die.emit()
	enemy.queue_free()

func _on_timer_timeout():
	die()
