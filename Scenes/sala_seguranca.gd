extends Node3D

var target_light_left_energy := 0.0
var target_light_right_energy := 0.0
var left_light_on := false
var right_light_on := false
 
@onready var left_door := $"DoorEsquerda"
@onready var right_door := $"DoorDireita"
@onready var left_light := $"LuzEsquerda"
@onready var right_light := $"LuzDireita"
 
const light_transition_turnoff := 4.0
const light_transition_turnon := 8.0
 
func _process(delta):
	if left_light_on:
		left_light.light_energy = lerp(left_light.light_energy, 1.0, delta * light_transition_turnon)
	else:
		left_light.light_energy = lerp(left_light.light_energy, 0.0, delta * light_transition_turnoff)
	if right_light_on:
		right_light.light_energy = lerp(right_light.light_energy, 1.0, delta * light_transition_turnon)
	else:
		right_light.light_energy = lerp(right_light.light_energy, 0.0, delta * light_transition_turnoff)
 
func _on_DoorButtonLeft_input_event(camera, event, click_position, click_normal, shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		left_door.toggle()
 
func _on_DoorButtonRight_input_event(camera, event, click_position, click_normal, shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		right_door.toggle()
 
func _on_LightButtonLeft_input_event(camera, event, click_position, click_normal, shape_idx) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		left_light_on = !left_light_on
 
func _on_LightButtonRight_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		right_light_on = !right_light_on
 
