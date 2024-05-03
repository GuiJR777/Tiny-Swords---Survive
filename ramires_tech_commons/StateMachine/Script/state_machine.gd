class_name StateMachine
extends Node

signal transitioned(state_name: String)

@export var initial_state := NodePath()

@onready var current_state: State = get_node(initial_state)


func _ready() -> void:
	await owner.ready
	for child in get_children():
		child.state_machine = self

	current_state.enter()


func update(delta: float) -> void:
	current_state.update(delta)

func physics_update(delta: float) -> void:
	current_state.physics_update(delta)


func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return
	
	var new_state: State = get_node(target_state_name)
	
	if current_state == new_state: return
	
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter(msg)
	
	transitioned.emit(current_state.name)
