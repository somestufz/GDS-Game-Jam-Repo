class_name PlateDoor
extends Interactable

@export var door_offset : Vector2 = Vector2.ZERO
@export var door_rotation : int = 0
@onready var door_joint: Node2D = $DoorJoint
@onready var door: StaticBody2D = $DoorJoint/Door

var pressed := false
var pressed_counter = 0

func _ready() -> void:
	super()
	door_joint.position = door_offset * tile_size
	door.rotation_degrees = door_rotation

func _process(delta: float) -> void:
	door.position = lerp(door.position,Vector2(0,1 * clamp(pressed_counter,0,1) * tile_size),delta * 8.0)
	

func player_entered(body : Node2D) -> void:
	pressed = true
	pressed_counter += 1
	print(pressed)

func item_entered(body : Node2D) -> void:
	pressed = true
	pressed_counter += 1

func player_exit(body : Node2D) -> void:
	pressed = false
	pressed_counter -= 1

func item_exit(body : Node2D) -> void:
	pressed = false
	pressed_counter -= 1
