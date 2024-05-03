class_name PauseMenuInputHandler
extends Node


signal unpause


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused:
		unpause.emit()
