extends Area2D


signal trigger


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player": return
	trigger.emit()
	queue_free()
