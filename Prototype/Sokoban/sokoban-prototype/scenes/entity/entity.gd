class_name Entity
extends CharacterBody2D

var tile_size = 100
enum entities {HORSE,BOX,WALL}
@export var entity : entities

@onready var ray_1: RayCast2D = $RayDown
@onready var sprite_holder: Node2D = $SpriteHolder


func push_direction(dir : Vector2) -> bool:
	
	ray_1.target_position = tile_size * dir
	ray_1.force_raycast_update()
	
	twitch_anim()
	
	#"""SHOULD BE A MATCH CASE BUT IG ITS A PROTOTYPE
	#SAME THING FOR ANY CHECKING OF WHAT THE ITEM IS"""
	#match collider:
		#null:
			#print("null call please")
			#move(dir)
			#return true
		#Item:
			#var move_bool = collider.push_direction(dir)
			#if move_bool:
				#move(dir)
				#return true
			#else:
				#return false
		#_:
			#if(collider).is_in_group("Walls"):
				#return false
			#else:
				#return true
	
	var collider = ray_1.get_collider()
	
	
	if collider == null:
		move(dir)
		return true
	elif collider is Chamaeleon:
		print(collider.ability)
		if collider.ability:
			move(dir)
			return true
		else:
			var move_bool = collider.push_direction(dir)
			if move_bool:
				move(dir)
				return true
			else:
				return false
	elif(collider is Item or collider is Player):
		var move_bool = collider.push_direction(dir)
		if move_bool:
			move(dir)
			return true
		else:
			return false
	elif((collider).is_in_group("Walls")):
		return false
	
	return true

func pull_direction(dir : Vector2) -> void:
	move(dir)

func move(dir):
	var vector_change = dir * tile_size
	#position += vector_change
	move_anim(vector_change)

func twitch_anim():
	var tween = get_tree().create_tween()
	tween.tween_property(sprite_holder,"scale",Vector2(0.9,0.9),0.1)
	tween.tween_property(sprite_holder,"scale",Vector2(1.0,1.0),0.1)

func move_anim(vector_change):
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",position + vector_change,0.1)
