extends Node2D

@export var wobble_amplitude := 1.0  # Pixels of movement
@export var wobble_speed := 2.0      # Speed of wobble

var base_position: Vector2

func _ready():
	base_position = position  # Save the original position

func _process(delta):
	var wobble_x = sin(Time.get_ticks_msec() / 1000.0 * wobble_speed) * wobble_amplitude
	var wobble_y = cos(Time.get_ticks_msec() / 1000.0 * wobble_speed * 1.2) * wobble_amplitude * 0.5
	position = base_position + Vector2(wobble_x, wobble_y)
