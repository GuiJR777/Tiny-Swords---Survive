extends Control


@onready var transition: Transition = %Transition


func _ready():
	transition.in_finish.connect(get_tree().quit)

func _on_start_button_pressed():
	ScenesManager.change_scene(ScenesManager.GAME)


func _on_exit_button_pressed():
	transition.play_in()
