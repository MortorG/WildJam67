extends Node2D
class_name SoundsPlayer

# Called when the node enters the scene tree for the first time.
var sounds : Dictionary = {}

func _ready():
	for child in get_children():
		if child is AudioStreamPlayer:
			sounds[child.name.to_lower()] = child

func play_sound(sound_name: String):
	var s: AudioStreamPlayer = sounds.get(sound_name.to_lower())
	if !s:
		return
	s.play()
