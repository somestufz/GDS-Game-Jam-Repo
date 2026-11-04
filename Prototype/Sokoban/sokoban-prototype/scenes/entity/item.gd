class_name Item
extends Entity

@onready var ray_1: RayCast2D = $RayDown


func push_direction(dir : Vector2) -> bool:
	
	ray_1.target_position = tile_size * dir
	ray_1.force_raycast_update()
	
	
	"""SHOULD BE A MATCH CASE BUT IG ITS A PROTOTYPE
	SAME THING FOR ANY CHECKING OF WHAT THE ITEM IS"""
	var collider = ray_1.get_collider()
	if(collider == null):
		move(dir)
		return true
	elif(ray_1.get_collider() is Item):
		var move_bool = collider.push_direction(dir)
		if move_bool:
			move(dir)
			return true
		else:
			return false
	elif(ray_1.get_collider()).is_in_group("Walls"):
		return false
	
	return true

func move(dir):
	var vector_change = dir * tile_size
	position += vector_change
