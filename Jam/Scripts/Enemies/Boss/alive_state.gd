extends State
class_name Boss_Alive_State

func die(_1, _2, _3):
	print("boss dead")
	print(self)
	transition.emit(self, "dying")
