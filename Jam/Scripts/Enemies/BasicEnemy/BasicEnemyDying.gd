extends State

@export var enemy : Enemy
@export var anim : AnimatedSprite2D
@export var col : CollisionShape2D

func enter():
	anim.play("die")
	col.set_deferred("disabled", true)
	enemy.velocity = Vector2.ZERO
	$Timer.start()

func die():
	enemy.queue_free()

func _on_timer_timeout():
	die()
