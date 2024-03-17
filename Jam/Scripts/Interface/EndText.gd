extends Label

@onready var timer = $Timer

signal spawn_enemy
signal next_phrase


func _ready():
	await timer.timeout
	var text_data = G.read_json("end_text")
	for key in text_data.keys():
		var text_item = text_data[key]
		text = text_item.text
		
		timer.start(text_item.time)
		await timer.timeout
	visible = false
