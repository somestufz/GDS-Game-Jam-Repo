class_name Chamaeleon
extends Player

var ability := false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var num_inside_area := 0

func _process(delta: float) -> void:
	super(delta)
	
	if Input.is_action_just_pressed("ability") and active and num_inside_area <= 0:
		ability = !ability
	
	modulate.a = 1.0 - (int(ability) * 0.8)
	collision_shape_2d.disabled = ability

func player_action(collider, dir, vector_change) -> void:
	if collider != null:
		if collider.is_in_group("Walls"):
			pass
		elif ability:
			move_anim(vector_change)
		elif(collider is Item or collider is Player):
			pass
	else:
		move_anim(vector_change)



func _on_detector_body_entered(body: Node2D) -> void:
	if body != self:
		num_inside_area += 1


func _on_detector_body_exited(body: Node2D) -> void:
	if body != self:
		num_inside_area -= 1
