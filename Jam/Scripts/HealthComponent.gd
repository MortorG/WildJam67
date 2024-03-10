class_name HealthComponent
extends Node

signal on_health_change(prev : int, cur : int, max : int)
signal on_heal (prev : int, cur : int, max : int)
signal on_damage (prev : int, cur : int, max : int)
signal on_zero (prev : int, cur : int, max : int)

@export var max_health : int
@export var cur_health : int

func init(max_v : int, cur : int):
	max_health = max_v
	cur_health = cur

func damage(amount : int):
	var prev = cur_health
	cur_health -= amount
	cur_health = clamp(cur_health, 0, max_health)
		
	on_health_change.emit(prev, cur_health, max_health)
	on_damage.emit(prev, cur_health, max_health)
	if cur_health == 0:
		on_zero.emit(prev, cur_health, max_health)
	print(cur_health)

func heal(amount : int):
	var prev = cur_health
	cur_health += amount
	clamp(cur_health, 0, max_health)
	
	on_health_change.emit(prev, cur_health, max_health)
	on_heal.emit(prev, cur_health, max_health)
