class_name LevelsLoader


var tree: SceneTree
var current_level: Enums.Levels


func _init(scene_tree: SceneTree) -> void:
	tree = scene_tree


func change_level(level: Enums.Levels) -> void:
	tree.change_scene_to_file("res://Scenes/Levels/{level}.tscn".format({
		"level": Enums.Levels.keys()[level]
	}))
	current_level = level

