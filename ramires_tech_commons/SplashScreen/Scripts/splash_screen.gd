extends Control


@onready var sounds_player: AudioStreamPlayer2D = $Sounds


func play_sound() -> void:
	sounds_player.play()

func go_to_menu() -> void:
	ScenesManager.change_scene(ScenesManager.MAIN_MENU)
