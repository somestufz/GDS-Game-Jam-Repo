extends Node2D

@onready var players: Node2D = $Entities/Players


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assign_player_ids()
	update_active_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("shift"):
		shift()

func shift() -> void:
	print("shift shift")
	var num_of_players = players.get_child_count()
	
	Globals.player_id += 1
	if Globals.player_id >= num_of_players - 1:
		Globals.player_id = 0
	
	update_active_player()

func update_active_player():
	for player in players.get_children():
		player.active = (player.player_id == Globals.player_id)
		print()
	

func assign_player_ids() -> void:
	var counter = 0
	for player in players.get_children():
		player.player_id = counter
		counter += 1
