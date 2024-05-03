class_name FloatingText
extends Label3D


@onready var tween: Tween = create_tween()

@export var xp_color: Color
@export var hp_color: Color
@export var mp_color: Color
@export var damage_color: Color
@export var level_color: Color

enum ValueSignal{
	POSITIVE,
	NEGATIVE,
	NOT_SIGNAL
}

enum TextType {
	XP,
	HP,
	MP,
	DAMAGE,
	LEVEL
}

var velocity: Vector3
var gravity: Vector3 = Vector3.UP

var value: String
var type: TextType
var math_signal: ValueSignal

func _ready():
	randomize()
	velocity = Vector3(
		randi_range(-1, 1),
		1,
		0
	)
	floating_text()

func floating_text() -> void:
	match math_signal:
		ValueSignal.POSITIVE:
			text = "+" + value
		ValueSignal.NEGATIVE:
			text = "-" + value
		ValueSignal.NOT_SIGNAL:
			text = value

	match type:
		TextType.XP:
			text += " XP"
			modulate = xp_color
		TextType.HP:
			modulate = hp_color
		TextType.MP:
			modulate = mp_color
		TextType.DAMAGE:
			modulate = damage_color
		TextType.LEVEL:
			text = "LEVEL UP"
			modulate = level_color

	interpolate()

func interpolate() -> void:
	tween.tween_property(
		self, "scale", Vector3.ONE, 0.3
	).from(Vector3.ZERO).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

	tween.tween_property(
		self, "scale", Vector3(0.4, 0.4, 0), 1.0
	).from(Vector3.ONE).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)

	tween.tween_property(
		self, "modulate:a", 0.0, 3.0
	).set_trans(Tween.TRANS_LINEAR).from(1.0).set_ease(Tween.EASE_OUT).set_delay(0.7)

	await get_tree().create_timer(1.5).timeout
	queue_free()

func _process(delta):
	velocity += gravity * delta
	position += velocity * delta
