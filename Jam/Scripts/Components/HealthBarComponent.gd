extends Node

@export var health_bar_prefab: PackedScene
@export var health_component: HealthComponent

@onready var parent = get_parent()

func _ready():
	var health_bar = health_bar_prefab.instantiate()
	
	health_bar.owner_character = parent
	if health_component != null:
		health_component.on_health_change.connect(health_bar.show_bar)
	
	parent.get_parent().call_deferred("add_child", health_bar)
	
