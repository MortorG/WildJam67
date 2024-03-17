extends State

@export var anim : AnimatedSprite2D
@export var hitboxes : Array[CollisionShape2D]
@export var timers : Array[Timer]
@export var sounds_player: SoundsPlayer

func enter():
	anim.play("die")
	sounds_player.play_sound("die")
	for item in hitboxes:
		item.set_deferred("disabled", true)
	for item in timers:
		item.stop()
	$GameOverTime.start()


# TODO: ADD GAME OVER SCREEN
func _on_game_over_time_timeout():
	pass
