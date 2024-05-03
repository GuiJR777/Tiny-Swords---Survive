extends Control


@onready var pause_menu = %PauseMenu


func _on_game_input_handler_pause():
	pause_menu.open()
	
