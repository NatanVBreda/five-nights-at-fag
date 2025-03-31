extends Node3D
 
var screen_size : Vector2
var left_dist : float
var right_dist : float
var sensitivity : float
var initial_turning_speed : float
 
const light_transition := 4.0
 
func _ready() -> void:
	screen_size = get_viewport().size
	left_dist = screen_size.x / 3
	right_dist = left_dist + screen_size.x / 3
	sensitivity = 768 / screen_size.x
	initial_turning_speed = screen_size.x / 15360
 
func _process(delta : float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	if mouse_position.x < left_dist:
		rotate_y(deg_to_rad((left_dist - mouse_position.x) * delta * sensitivity + initial_turning_speed))
	elif mouse_position.x > right_dist:
		rotate_y(deg_to_rad(-(mouse_position.x - right_dist) * delta * sensitivity - initial_turning_speed))
	rotation.y = clamp(rotation.y, deg_to_rad(-50.0), deg_to_rad(50.0))
