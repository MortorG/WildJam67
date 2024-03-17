extends State

@export var enemy : Enemy
@export var anim : AnimatedSprite2D
@export var hitboxes : Array[CollisionShape2D]
@export var timers : Array[Timer]
@export var win_game: bool 

signal enemy_died

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
	if win_game:
		G.levels.change_level(Enums.Levels.win)

func _on_timer_timeout():
	die()
