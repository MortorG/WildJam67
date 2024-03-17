extends Node2D

@onready var parasite: Sprite2D = $Parasite
@onready var foreground: Sprite2D = $Foreground
@onready var enemies: Sprite2D = $Enemies
@onready var midground: Sprite2D = $Midground
@onready var enemies_2: Sprite2D = $Enemies2
@onready var boss: Sprite2D = $Boss
@onready var background: Sprite2D = $Background

func _process(delta):
	parasite.position += (get_global_mouse_position() * delta) - parasite.position
	foreground.position += (get_global_mouse_position() * 2 * delta) - foreground.position

	enemies.position += (get_global_mouse_position() / 1.5 * delta) - enemies.position
	midground.position += (get_global_mouse_position() / 2 * delta) - midground.position
	enemies_2.position += (get_global_mouse_position() / 2.5 * delta) - enemies_2.position
	boss.position += (get_global_mouse_position() / 3 * delta) - boss.position
	background.position += (get_global_mouse_position() / 5 * delta) - background.position
