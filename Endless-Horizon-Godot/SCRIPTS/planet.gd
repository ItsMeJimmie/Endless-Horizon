# Planet.gd
extends Node2D

@onready var orbit_center:= $"../Sun"
@export var orbit_radius := 650.0
@export var orbit_speed := 0.05
@export var initial_angle := 0.0

var current_angle := 0.0

func _ready():
	current_angle = initial_angle

func _process(delta):
	current_angle += orbit_speed * delta
	current_angle = fmod(current_angle, TAU)

	var offset = Vector2(
		cos(current_angle) * orbit_radius,
		sin(current_angle) * orbit_radius * 0.5
	)
	global_position = orbit_center.global_position + offset

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("tiles"):  # We'll put tiles in a group
		area.get_parent().target_pos = area.get_parent().jump_height

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("tiles"):
		area.get_parent().target_pos = 0.0
