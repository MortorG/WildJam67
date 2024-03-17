extends Node2D

@export var prefab: PackedScene
@export var player : Node2D

signal spawned(enemy: Enemy)

func spawn() -> void:
	var instance = prefab.instantiate()
	instance.player = player
	get_parent().call_deferred("add_child", instance)
	instance.global_position = global_position
	spawned.emit(instance)
	
	for counter in get_tree().get_nodes_in_group("counters"):
		counter.connect_enemy(instance)
	
	for exit in get_tree().get_nodes_in_group("exits"):
		exit.enemy_spawned(instance)
