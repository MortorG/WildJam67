extends Label


@onready var timer = $Timer
@onready var next_label = $Label


signal spawn_enemy
signal next_phrase


func _ready():
	await timer.timeout
	next_label.visible = true
	
	var tutorial_data = G.read_json("tutorial_text")
	for key in tutorial_data.keys():
		var tutorial_item = tutorial_data[key]
		text = tutorial_item.text
		
		if tutorial_item.has("spawn"):
			spawn_enemy.emit()
		
		await self.next_phrase
	visible = false


func _process(_delta) -> void:
	if visible and Input.is_action_just_pressed("space"):
		next_phrase.emit()
