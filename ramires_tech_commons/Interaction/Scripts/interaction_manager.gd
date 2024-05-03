extends Node


@onready var label: Label3D = %Label3D

const base_text: String = "[E] press to "

var player: Player
var active_areas: Array[InteractionArea3D] = []
var can_interact = true


func register_area(area: InteractionArea3D) -> void:
	active_areas.push_back(area)


func unregister_area(area: InteractionArea3D) -> void:
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)


func _process(delta: float) -> void:
	if not player:
		player = Global.player_instance
	if active_areas.size() > 0 and can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		var selected_area = active_areas[0]
		label.text = base_text + selected_area.action_name
		label.global_position = selected_area.global_position
		label.global_position.y += selected_area.label_height_offset
		label.show()
	else:
		label.hide()


func _sort_by_distance_to_player(area1, area2) -> bool:
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)

	return area1_to_player < area2_to_player

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			label.hide()

			await active_areas[0].interact.call()

			can_interact = true
