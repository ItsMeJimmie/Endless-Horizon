extends Camera2D

@export var zoom_step := 0.1        # How much to zoom in/out per scroll
@export var min_zoom := 0.5         # Smallest zoom (closer)
@export var max_zoom := 2.0         # Largest zoom (farther)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom = Vector2(
				clamp(zoom.x - zoom_step, min_zoom, max_zoom),
				clamp(zoom.y - zoom_step, min_zoom, max_zoom)
			)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom = Vector2(
				clamp(zoom.x + zoom_step, min_zoom, max_zoom),
				clamp(zoom.y + zoom_step, min_zoom, max_zoom)
			)
