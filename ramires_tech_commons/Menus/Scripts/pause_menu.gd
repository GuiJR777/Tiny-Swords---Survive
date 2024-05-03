class_name PauseMenu
extends Control

@onready var animation_player = %AnimationPlayer
@onready var pause_menu_input_handler = %PauseMenuInputHandler
@onready var canvas_layer = %CanvasLayer


func open() -> void:
	animation_player.play("show_menu")
	await animation_player.animation_finished
	get_tree().paused = true

func close() -> void:
	get_tree().paused = false
	animation_player.play("hide_menu")
	await animation_player.animation_finished


func _on_pause_menu_input_handler_unpause():
	close()


func _on_continue_button_pressed():
	close()


func _on_menu_button_pressed():
	get_tree().paused = false
	ScenesManager.change_scene(ScenesManager.MAIN_MENU)
