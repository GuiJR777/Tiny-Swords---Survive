class_name GameInputHandler
extends Node


signal pause


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and not get_tree().paused:
		pause.emit()
