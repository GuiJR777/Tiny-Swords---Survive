class_name Transition
extends CanvasLayer


@onready var transition: ColorRect = %Fill
@onready var animation: AnimationPlayer = %AnimationPlayer

signal in_finish
signal out_finish

enum TransitionsType{
	Pixels,
	SpotPlayer,
	SpotCenter,
	VerticalCut,
	HorizontalCut
}

@export var transiction_type: TransitionsType
@export var duration: float = 1.0


func _ready() -> void:
	transition.material.set_shader_parameter("type", transiction_type)
	animation.speed_scale = duration

func play_in() -> void:
	show()
	animation.play("transiction_in")

func play_out() -> void:
	show()
	animation.play("transiction_out")


func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "transiction_in":
		in_finish.emit()
	elif anim_name == "transiction_out":
		out_finish.emit()
	
	hide()
