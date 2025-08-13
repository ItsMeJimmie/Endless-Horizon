extends Node2D

@onready var nav2d: NavigationAgent2D = $NavigationAgent2D

var speed: float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	manual_navigation()
	navigate(delta)

func manual_navigation() -> void:
	if Input.is_action_just_pressed("set_target"):
		nav2d.target_position = get_global_mouse_position()

func navigate(delta: float) -> void:
	if nav2d.is_navigation_finished():
		return
	var nextPathPosition: Vector2 = nav2d.get_next_path_position()
	var newVelocity: Vector2 = (
		global_position.direction_to(nextPathPosition) * speed
	)
	position += newVelocity * delta
	
