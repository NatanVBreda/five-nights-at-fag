extends Node3D

@onready var game: Node = get_tree().root.get_node("Game")

func _on_DoorButtonLeft_pressed() -> void:
	if game.out_of_power:
		return
	$LeftDoor.close()
	game.left_door_closed = true

func _on_DoorButtonRight_pressed() -> void:
	if game.out_of_power:
		return
	$RightDoor.close()
	game.right_door_closed = true

func _on_DoorButtonLeft_unpressed() -> void:
	if game.out_of_power:
		return
	$LeftDoor.open()
	game.left_door_closed = false

func _on_DoorButtonRight_unpressed() -> void:
	if game.out_of_power:
		return
	$RightDoor.open()
	game.right_door_closed = false

func _on_Power_out_of_power() -> void:
	$LeftDoor.open()
	game.left_door_closed = false
	
	$RightDoor.open()
	game.right_door_closed = false
