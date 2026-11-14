extends Node2D

@onready var players: Node2D = $Entities/Players
@onready var items: Node2D = $Entities/Items

var entity_references : Array[CharacterBody2D];
var location_dictionary_save : Dictionary
var lol_array : Array[Dictionary]
var turn_number := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assign_player_ids()
	update_active_player()
	assign_entity_references()
	turn_number = 0
	lol_array.push_back(update_location_dictionary())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("shift"):
		shift()
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("undo"):
		turn_number -= 1
		turn_number = max(0,turn_number)
		if !lol_array.is_empty():
			load_location_dictionary(lol_array.pop_back())

func shift() -> void:
	var num_of_players = players.get_child_count()
	
	Globals.player_id += 1
	if Globals.player_id > num_of_players - 1:
		Globals.player_id = 0
	
	update_active_player()

func update_active_player():
	for player in players.get_children():
		player.active = (player.player_id == Globals.player_id)
	

func assign_player_ids() -> void:
	var counter = 0
	for player in players.get_children():
		player.player_id = counter
		counter += 1

func assign_entity_references() -> void:
	for player in players.get_children():
		entity_references.append(player)
	
	for item in items.get_children():
		entity_references.append(item)

func update_location_dictionary() -> Dictionary:
	var location_dictionary : Dictionary
	for player in players.get_children():
		player = player as CharacterBody2D
		location_dictionary[player] = player.position
	
	for item in items.get_children():
		item = item as CharacterBody2D
		location_dictionary[item] = item.position
	return location_dictionary

func load_location_dictionary(dict : Dictionary) -> void:
	for entity in dict.keys():
		entity.position = dict[entity]

func player_move() -> void:
	turn_number += 1
	lol_array.push_back(update_location_dictionary())
