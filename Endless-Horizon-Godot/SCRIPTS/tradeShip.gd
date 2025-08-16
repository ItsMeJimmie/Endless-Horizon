extends Node2D

@export var point_a: Vector2
@export var point_b: Vector2
@export var move_speed: float = 50.0

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var going_to_a := false

func _ready() -> void:
	# Start by moving to point B
	nav_agent.target_position = point_b
	
func _process(delta: float) -> void:
	# Get next path point from navmesh
	var next_point = nav_agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	
	# Move ship
	global_position += direction * move_speed * delta
	
	# If close to the target point, swap
	if global_position.distance_to(nav_agent.target_position) < 5.0:
		going_to_a = !going_to_a
		nav_agent.target_position = point_a if going_to_a else point_b
