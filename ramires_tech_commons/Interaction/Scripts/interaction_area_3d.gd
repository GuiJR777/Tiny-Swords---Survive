class_name InteractionArea3D
extends Area3D


@export var action_name: String = "interact"
@export var label_height_offset: float = 3.0
@export var can_interact: float = true

var interact: Callable = func():
	pass


func _on_body_entered(body: Node3D) -> void:
	if not can_interact:return
	InteractionController.register_area(self)


func _on_body_exited(body: Node3D) -> void:
	InteractionController.unregister_area(self)
