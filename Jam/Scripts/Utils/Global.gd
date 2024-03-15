extends Node

var levels: LevelsLoader
var unlocks: Unlocks

func _ready():
	levels = LevelsLoader.new(get_tree())
	unlocks = load("res://Resources/unlocks.tres")


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func read_json(file_name: String) -> Dictionary:
	var file = FileAccess.open("res://Resources/Json/{file_name}.json".format({
		"file_name": file_name
	}), FileAccess.READ)
	
	var content = file.get_as_text()
	return JSON.parse_string(content)

