class_name PlayerWalkState
extends State


var player: Player

func enter(_msg := {}):
	player = state_machine.owner
	player.input_reader.moving.connect(on_move)


func update(_delta):
	if player.data.reusable_data.move_vector == Vector2.ZERO:
		state_machine.transition_to("Idle")
		return

func physics_update(delta: float) -> void:
	var move_target: Vector2 = player.data.reusable_data.move_vector
	var target_velocity = move_target * player.data.move_speed
	var x_axis: float = move_target.x
	
	if x_axis:
		player.body.flip_h = x_axis < 0
	
	player.velocity = lerp(player.velocity, target_velocity, 0.05)
	player.move_and_slide()
	

func on_move(move_vector: Vector2) -> void:
	player.data.reusable_data.move_vector = move_vector
