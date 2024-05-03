extends Node


@onready var transition_scene: PackedScene = preload("res://ramires_tech_commons/TransitionScene/Scenes/transition_scene.tscn")

const MAIN_MENU = "res://ramires_tech_commons/Menus/Scenes/main_menu.tscn"
const GAME = "res://scenes/game/game_scene.tscn"

var scene_to_transition: String

func change_scene(scene_name: String) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	scene_to_transition = scene_name
	get_tree().change_scene_to_packed(transition_scene)
