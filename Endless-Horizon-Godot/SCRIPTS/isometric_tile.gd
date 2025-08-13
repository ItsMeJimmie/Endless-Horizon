extends Node2D

@export var jump_height := -10
@export var jump_speed := 10

@onready var sprite : Sprite2D = $Sprite2D

var target_pos := 0.0
var tile_raised = false

func _on_area_2d_mouse_entered() -> void:
	target_pos = jump_height

func _on_area_2d_mouse_exited() -> void:
	target_pos = 0.0

func _process(delta: float) -> void:
	sprite.position.y = lerp(sprite.position.y, target_pos, jump_speed * delta)
	
