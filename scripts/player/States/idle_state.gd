class_name PlayerIdleState
extends State


var player: Player

func enter(_msg := {}):
	player = state_machine.owner
	player.input_reader.moving.connect(on_move)


func update(_delta):
	if player.data.reusable_data.move_vector != Vector2.ZERO:
		state_machine.transition_to("Walk")
		return
	

func on_move(move_vector: Vector2) -> void:
	player.data.reusable_data.move_vector = move_vector
