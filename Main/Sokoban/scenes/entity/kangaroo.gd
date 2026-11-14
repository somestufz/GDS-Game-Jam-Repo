class_name Kangaroo
extends Player

func _process(delta: float) -> void:
	if active:
		if !done_action and buffer_action != "":
			player_move_mult(buffer_action)
			main.player_move()
			buffer_action = ""
	else:
		buffer_action = ""

func player_move_mult(dir): #changes to make the player move 2 tiles instead, ignoring walls
	var vector_change = inputs[dir] * tile_size
	
	ray.hit_from_inside = true
	ray.target_position = vector_change * 0.5
	ray.position = vector_change * 1.6
	ray.force_raycast_update()
	
	var collider = ray.get_collider()
	ray.position = Vector2()
	ray.hit_from_inside = false
	
	player_action(collider, dir, vector_change * 2)
