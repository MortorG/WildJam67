class_name StateMachine
extends Node

@export var initialState : State

var currentState : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(on_child_transition)
	if initialState:
		initialState.enter()
		currentState = initialState

func _process(delta):
	if currentState:
		currentState.update(delta)


func _physics_process(delta):
	if currentState:
		currentState.physics_update(delta)

func on_child_transition(state, new_state_name):
	if state != currentState:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if currentState:
		currentState.exit()
	
	new_state.enter()
	currentState = new_state
