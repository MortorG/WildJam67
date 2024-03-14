extends Label


@onready
var timer = $Timer


signal spawn_enemy


func _ready():
	var tutorial_data = G.read_json("tutorial_text")
	for key in tutorial_data.keys():
		var tutorial_item = tutorial_data[key]
		text = tutorial_item.text
		
		if tutorial_item.has("spawn"):
			spawn_enemy.emit()
		
		timer.start(tutorial_item.time)
		await timer.timeout
	visible = false
