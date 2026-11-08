class_name Snake
extends Player


func player_action(collider, dir, vector_change) -> void:
	#if collider != null:
		#if collider.is_in_group("Walls"):
			#pass
		#elif(collider is Item or collider is Player):
			#var can_push = collider.push_direction(inputs[dir])
			#if can_push:
				#move_anim(vector_change)
			#else:
				#pass
	#else:
		#move_anim(vector_change)
	
	if collider == null:
		move_anim(vector_change)
		
		ray.target_position = vector_change * -1
		ray.force_raycast_update()
		var collider_back = ray.get_collider()
		
		if collider_back is Item or collider_back is Player:
			collider_back.pull_direction(inputs[dir])
			print("pulling")
