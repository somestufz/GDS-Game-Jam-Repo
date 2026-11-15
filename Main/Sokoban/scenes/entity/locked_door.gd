class_name LockedDoor
extends Item

@onready var door_joint: Node2D = $DoorJoint

var unlocked := false

func unlock() -> void:
	position = Vector2(10000,10000)
	print("unlock")

func move_anim(vector_change):
	pass
