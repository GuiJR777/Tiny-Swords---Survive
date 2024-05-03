class_name FloatingTextEmmiter
extends Node

@onready var floating_text: PackedScene = preload("res://Scenes/Components/floating_text.tscn")


func spawn_damage_value(value: int) -> void:
	var text = floating_text.instantiate() as FloatingText
	text.position = owner.global_position
	text.type = FloatingText.TextType.DAMAGE
	text.math_signal = FloatingText.ValueSignal.NEGATIVE
	text.value = str(value)

	owner.add_sibling(text)

func spawn_level_up() -> void:
	var text = floating_text.instantiate() as FloatingText
	text.position = owner.global_position
	text.type = FloatingText.TextType.LEVEL
	text.math_signal = FloatingText.ValueSignal.NOT_SIGNAL
	text.value = "Level UP"

	owner.add_sibling(text)
