class_name Player
extends Entity



@onready var ray: RayCast2D = $RayDown


var inputs = {
	"move_up" : Vector2.UP,
	"move_down" : Vector2.DOWN,
	"move_left" : Vector2.LEFT,
	"move_right" : Vector2.RIGHT
}

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs:
		if Input.is_action_just_pressed(dir):
			move(dir)

func move(dir):
	var vector_change = inputs[dir] * tile_size
	
	ray.target_position = vector_change
	ray.force_raycast_update()
	
	if ray.get_collider() != null:
		if ray.get_collider().is_in_group("Walls"):
			print("cant")
	else:
		position += vector_change
	
	
