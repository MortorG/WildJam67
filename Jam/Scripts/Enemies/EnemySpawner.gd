extends Node2D

@export var prefab: PackedScene
@export var player : Node2D

signal spawned(enemy: Enemy)

func spawn() -> void:
	var instance = prefab.instantiate()
	instance.player = player
	get_parent().add_child(instance)
	instance.global_position = global_position
	spawned.emit(instance)
