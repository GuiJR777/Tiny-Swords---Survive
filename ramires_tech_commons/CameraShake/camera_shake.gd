extends Node

var camera_shake_intensity = 0.0
var camera_shake_duration = 0.0

enum Type {Random, Sine, Noise}
var camera_shake_type = Type.Random
var camera: Camera3D

var noise : FastNoiseLite

func _ready():
	noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.fractal_octaves = 4
	noise.frequency = 0.8


func shake(intensity, duration, type = Type.Random):
	if intensity > camera_shake_intensity and duration > camera_shake_duration:
		camera_shake_intensity = intensity
		camera_shake_duration = duration
		camera_shake_type = type


func _process(delta):
	if not camera:return
	if camera_shake_duration <= 0:
		camera.h_offset = 0
		camera.v_offset = 0
		camera_shake_intensity = 0.0
		camera_shake_duration = 0.0
		return

	camera_shake_duration = camera_shake_duration - delta

	var offset = Vector2.ZERO

	if camera_shake_type == Type.Random:
		offset = Vector2(randf(), randf()) * camera_shake_intensity

	if camera_shake_type == Type.Sine:
		offset = Vector2(sin(Time.get_ticks_msec() * 0.03), sin(Time.get_ticks_msec() * 0.07)) * camera_shake_intensity * 0.5

	if camera_shake_type == Type.Noise:
		var noise_value_x = noise.get_noise_1d(Time.get_ticks_msec() * 0.1)
		var noise_value_y = noise.get_noise_1d(Time.get_ticks_msec() * 0.1 + 100.0)
		offset = Vector2(noise_value_x, noise_value_y) * camera_shake_intensity * 2.0

	camera.h_offset = offset.x
	camera.v_offset = offset.y
