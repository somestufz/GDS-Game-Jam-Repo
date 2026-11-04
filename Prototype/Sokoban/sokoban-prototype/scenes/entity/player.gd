class_name Player
extends Entity



@onready var ray: RayCast2D = $RayDown

var player_id := 0
var active := true

var inputs = {
	"move_up" : Vector2.UP,
	"move_down" : Vector2.DOWN,
	"move_left" : Vector2.LEFT,
	"move_right" : Vector2.RIGHT
}

func _unhandled_input(event: InputEvent) -> void:
	if active:
		for dir in inputs:
			if Input.is_action_just_pressed(dir):
				move(dir)

func move(dir):
	var vector_change = inputs[dir] * tile_size
	
	ray.target_position = vector_change
	ray.force_raycast_update()
	
	var collider = ray.get_collider()
	
	if collider != null:
		if collider.is_in_group("Walls"):
			print("cant")
		elif(collider is Item):
			var can_push = collider.push_direction(inputs[dir])
			if can_push:
				position += vector_change
			else:
				pass
	else:
		position += vector_change
	
	
