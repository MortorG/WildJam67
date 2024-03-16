extends Node
class_name BackgroundMusic

@export var intro_music: AudioStream
@export var background_music: AudioStream
@export var ambience: AudioStream

@onready var intro_player: AudioStreamPlayer = $Intro
@onready var loop_player: AudioStreamPlayer = $MainLoop
@onready var ambience_player: AudioStreamPlayer = $Ambience

func _ready():
	# load resources
	if intro_music:
		intro_player.stream = intro_music
	if background_music:
		loop_player.stream = background_music
	if ambience:
		ambience_player.stream = ambience
		ambience_player.play()
	
	# play intro if loaded, else play main loop
	if intro_player.stream:
		intro_player.play()
	else:
		if loop_player.stream:
			loop_player.play()

func _on_intro_finished():
	if loop_player.stream:
		loop_player.play()
