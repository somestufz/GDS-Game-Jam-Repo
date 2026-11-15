class_name Key
extends Item

func push_extra_check(collider):
	if collider == null:
		return null
	elif collider.is_in_group("Locked"):
		collider.unlock()
		global_position = Vector2(10000,10000)
