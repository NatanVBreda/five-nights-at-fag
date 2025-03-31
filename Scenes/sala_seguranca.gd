extends Node3D

var target_light_left_energy: float = 0.0
var target_light_right_energy: float = 0.0
var left_light_on: bool = false
var right_light_on: bool = false
 
@onready var left_door: Node = $DoorEsquerda
@onready var right_door: Node = $DoorDireita
@onready var left_light: Light3D = $LuzEsquerda
@onready var right_light: Light3D = $LuzDireita
 
const LIGHT_TRANSITION_TURNOFF: float = 4.0
const LIGHT_TRANSITION_TURNTON: float = 8.0
 
func _process(delta: float) -> void:
	if left_light_on:
		left_light.energy = lerp(left_light.energy, 1.0, delta * LIGHT_TRANSITION_TURNTON)
	else:
		left_light.energy = lerp(left_light.energy, 0.0, delta * LIGHT_TRANSITION_TURNOFF)
		
	if right_light_on:
		right_light.energy = lerp(right_light.energy, 1.0, delta * LIGHT_TRANSITION_TURNTON)
	else:
		right_light.energy = lerp(right_light.energy, 0.0, delta * LIGHT_TRANSITION_TURNOFF)
 
func _on_DoorButtonLeft_input_event(camera: Camera3D, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		left_door.toggle()
 
func _on_DoorButtonRight_input_event(camera: Camera3D, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		right_door.toggle()
 
func _on_LightButtonLeft_input_event(camera: Camera3D, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		left_light_on = not left_light_on
 
func _on_LightButtonRight_input_event(camera: Camera3D, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		right_light_on = not right_light_on
