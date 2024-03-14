extends Area2D

@export var new_level: Enums.Levels
var enemies_count: int


func enemy_spawned(enemy: Enemy) -> void:
	enemies_count += 1
	enemy.die.connect(enemy_died)


func enemy_died() -> void:
	enemies_count -= 1
	if enemies_count <= 0:
		visible = true


func _on_body_entered(body: Node2D) -> void:
	if visible and body.name == "Player":
		call_deferred("change_level")


func change_level():
	G.levels.change_level(new_level)
