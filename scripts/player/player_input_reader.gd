class_name PlayerInputReader
extends Node


signal moving(move_vector: Vector2)


func _process(delta):
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	moving.emit(move_vector)
