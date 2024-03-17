extends Node


@export var count_to_trigger: int
var count: int = 0

signal trigger


func _ready() -> void:
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if enemy is Enemy:
			connect_enemy(enemy)


func connect_enemy(enemy: Enemy) -> void:
	enemy.die.connect(_on_enemy_die)


func _on_enemy_die() -> void:
	count += 1
	if count == count_to_trigger:
		trigger.emit()
		queue_free()
