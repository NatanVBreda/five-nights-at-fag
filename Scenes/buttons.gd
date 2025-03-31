extends Area3D

const PRESSED_DISTANCE = 0.1

@onready var press_sound: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var mesh_instance: MeshInstance3D = $MeshInstance

@export var material: Material

var is_pressed: bool = false

signal pressed
signal unpressed

func _ready() -> void:
	# Em Godot 4 você pode usar também a propriedade material_override se preferir,
	# mas aqui usamos o método para substituir o material da superfície 0.
	mesh_instance.set_surface_override_material(0, material)

# Esse método será chamado quando o usuário clicar na área.
func _input_event(camera: Camera3D, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		is_pressed = !is_pressed

		if is_pressed:
			emit_signal("pressed")
			push_in()
		else:
			emit_signal("unpressed")
			push_out()

		press_sound.play()

func push_in() -> void:
	var t = mesh_instance.transform
	t.origin.x = -PRESSED_DISTANCE
	mesh_instance.transform = t

func push_out() -> void:
	var t = mesh_instance.transform
	t.origin.x = 0
	mesh_instance.transform = t
