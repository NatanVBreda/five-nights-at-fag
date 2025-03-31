extends Node3D

var is_open: bool = true
@onready var anim: AnimationPlayer = $AnimationPlayer

func toggle() -> void:
	is_open = not is_open
	if is_open:
		anim.play("Open")
	else:
		anim.play("Close")
