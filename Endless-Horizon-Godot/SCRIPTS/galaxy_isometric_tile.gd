#Author: Jimmie Cox
#Description: This is currently the script that handles the display of the 
#popup panel that will display the star system information.

extends Node2D

@onready var panel = $Panel

func _ready() -> void:
	pass
	
func _on_area_2d_mouse_entered() -> void:
	panel.visible = true
	
func _on_area_2d_mouse_exited() -> void:
	panel.visible = false
	
func change_content():
	pass
