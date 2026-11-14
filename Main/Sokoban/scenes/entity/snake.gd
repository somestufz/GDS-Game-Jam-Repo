class_name Snake
extends Player


func player_action(collider, dir, vector_change) -> void:
	if collider == null:
		move_anim(vector_change)
		
		ray.target_position = vector_change * -1
		ray.force_raycast_update()
		var collider_back = ray.get_collider()
		
		if collider_back is Item or collider_back is Player:
			collider_back.pull_direction(inputs[dir])
			print("pulling")
