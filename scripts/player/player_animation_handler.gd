class_name PlayerAnimationHandler
extends Node


var player: Player

func _ready():
	await owner.ready
	player = owner
	player.state_machine.transitioned.connect(on_transition_to_state)


func on_transition_to_state(anim_name: String) -> void:
	player.animation_player.play(anim_name)
