extends CharacterBody2D
class_name Player

@export var sounds_player: SoundsPlayer
@export var anim: AnimatedSprite2D

func _on_health_component_on_damage(prev, cur, max):
	sounds_player.play_sound("hit")

# TODO: need to add a dead state to state machine to play die animation
func _on_health_component_on_zero(prev, cur, max):
	anim.play("die")
	sounds_player.play_sound("die")
