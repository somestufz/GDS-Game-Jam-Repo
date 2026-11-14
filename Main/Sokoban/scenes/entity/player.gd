class_name Player
extends Entity



@onready var ray: RayCast2D = $RayDown
@onready var main : Node2D = $"../../.."

var player_id := 0
var active := true:
	set(value):
		if value:
			twitch_anim()
		active = value

var done_action := false
var buffer_action : String

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
				buffer_action = dir

func _process(delta: float) -> void:
	super(delta)
	if active:
		if !done_action and buffer_action != "":
			player_move(buffer_action)
			main.player_move()
			buffer_action = ""
	else:
		buffer_action = ""

func player_move(dir):
	var vector_change = inputs[dir] * tile_size
	
	ray.target_position = vector_change
	ray.force_raycast_update()
	
	var collider = ray.get_collider()
	
	player_action(collider, dir, vector_change)

func player_action(collider, dir, vector_change) -> void:
	if collider != null:
		if collider.is_in_group("Walls"):
			pass
		elif(collider is Item or collider is Player):
			var can_push = collider.push_direction(inputs[dir])
			if can_push:
				move_anim(vector_change)
			else:
				pass
	else:
		move_anim(vector_change)

func move_anim(vector_change):
	done_action = true
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",position + vector_change,0.1)
	await tween.finished
	done_action = false
