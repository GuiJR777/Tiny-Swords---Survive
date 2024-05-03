@tool
class_name InstagramButton
extends MarginContainer


const RAMIRES_TECH_INSTAGRAM_URL = "https://www.instagram.com/ramirestech.games/"

@export var normal_color: Color
@export var hover_color: Color

@onready var button: TextureButton = %TextureButton
@onready var panel: TextureRect = %Panel


func _ready() -> void:
	button.modulate = normal_color



func _on_texture_button_mouse_entered() -> void:
	button.modulate = hover_color


func _on_texture_button_mouse_exited() -> void:
	button.modulate = normal_color


func _on_texture_button_pressed() -> void:
	panel.show()


func _on_ok_button_pressed() -> void:
	OS.shell_open(RAMIRES_TECH_INSTAGRAM_URL)


func _on_close_button_pressed() -> void:
	panel.hide()
