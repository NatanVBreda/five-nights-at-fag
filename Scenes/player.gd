extends Node3D

var screen_size: Vector2
var left_dist: float
var right_dist: float
var sensitivity: float
var initial_turning_speed: float

const LIGHT_TRANSITION: float = 4.0

func _ready() -> void:
	screen_size = get_viewport().size
	left_dist = screen_size.x / 3.0
	right_dist = left_dist + screen_size.x / 3.0
	sensitivity = 768.0 / screen_size.x
	initial_turning_speed = screen_size.x / 15360.0

func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	if mouse_position.x < left_dist:
		rotate_y(deg_to_rad((left_dist - mouse_position.x) * delta * sensitivity + initial_turning_speed))
	elif mouse_position.x > right_dist:
		rotate_y(deg_to_rad(-(mouse_position.x - right_dist) * delta * sensitivity - initial_turning_speed))
	
	# Em Godot 4, para modificar apenas um componente do vetor de rotação, é ideal criar uma cópia,
	# atualizar o componente e atribuir o vetor completo de volta.
	var current_rotation: Vector3 = rotation
	current_rotation.y = clamp(current_rotation.y, deg_to_rad(-50.0), deg_to_rad(50.0))
	rotation = current_rotation
