extends Node2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: Sprite2D = $Sprite2D

@export var waypoints: Array[Vector2] = []   # Set per instance in editor
@export var speed: float = 60.0
@export var wait_time: float = 2.0

var current_index: int = 0
var waiting: bool = false

func _ready() -> void:
	if waypoints.size() > 0:
		nav_agent.target_position = waypoints[current_index]

func _physics_process(delta: float) -> void:
	if waiting or nav_agent.is_navigation_finished():
		return

	var next_position: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = global_position.direction_to(next_position)
	position += direction * speed * delta


	if global_position.distance_to(nav_agent.target_position) < 5.0:
		_on_reached_waypoint()

func _on_reached_waypoint() -> void:
	waiting = true
	await get_tree().create_timer(wait_time).timeout

	current_index = (current_index + 1) % waypoints.size()
	nav_agent.target_position = waypoints[current_index]
	waiting = false
