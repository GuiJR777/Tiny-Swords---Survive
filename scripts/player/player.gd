class_name Player
extends CharacterBody2D


@export var data: PlayerData

@onready var state_machine = %StateMachine
@onready var input_reader = %InputReader
@onready var animation_player = %AnimationPlayer
@onready var body = %Body


func _process(delta):
	state_machine.update(delta)

func _physics_process(delta):
	state_machine.physics_update(delta)
