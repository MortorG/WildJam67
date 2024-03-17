extends State
class_name Alive_State

func die(_1, _2, _3):
	print(self)
	transition.emit(self, "dying")
