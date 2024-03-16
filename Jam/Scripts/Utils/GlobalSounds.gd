extends Node
class_name GlobalSounds

var enemy_on_hit_sound: PackedScene = load("res://Scenes/Sounds/enemy_hit_sound.tscn")
var enemy_die_sound: PackedScene = load("res://Scenes/Sounds/enemy_die_sound.tscn")

func play_enemy_on_hit_sound():
	var s = enemy_on_hit_sound.instantiate()
	add_child(s)
	
func play_enemy_die_sound():
	var s = enemy_die_sound.instantiate()
	add_child(s)
