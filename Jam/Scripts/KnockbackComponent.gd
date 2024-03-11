extends Node
class_name KnockbackComponent

func knock_back(dir, force):
	var body := owner as PhysicsBody2D
	body.velocity = dir * force
	body.set_collision_mask_value(1, false)
	body.set_collision_mask_value(2, false)
	body.set_collision_layer_value(1, false)
	body.set_collision_layer_value(2, false)
	body.move_and_slide()
	body.set_collision_mask_value(1, true)
	body.set_collision_mask_value(2, true)
	body.set_collision_layer_value(1, true)
	body.set_collision_layer_value(2, true)
