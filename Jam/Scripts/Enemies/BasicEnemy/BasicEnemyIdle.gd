extends State

@export var anim : AnimatedSprite2D


#TESTING
func update(_delta):
	activate()
#TESTING



func enter():
	anim.play("idle")
	
func activate():
	transition.emit(self, "active")
