class_name LevelManager
extends Node2D

var current_level : Node2D
var current_level_id : int = -1

@onready var ui: Control = $"../UI"

@export var level_names : Array[String] = [
	"res://scenes/main/levels/level_horse_1.tscn",
	"res://scenes/main/levels/level_horse_2.tscn",
	"res://scenes/main/levels/level_horse_3.tscn"
]

func _ready() -> void:
	current_level = $Level

func _process(delta: float) -> void:
	print(Globals.end_zone_count, "/", Globals.end_zone_total)
	if Globals.end_zone_count == Globals.end_zone_total and ui.current_menu == "Game":
		current_level_id += 1
		load_to_level(current_level_id)

func load_to_level(id : int) -> void:
	print("loading to " + str(id))
	current_level.queue_free()
	Globals.end_zone_total = 0
	
	current_level_id = id
	
	var level_scene = load(level_names[id]) as PackedScene
	var level_scene_instance = level_scene.instantiate()
	add_child(level_scene_instance)
	current_level = level_scene_instance

func deload() -> void:
	print("deloading level")
	current_level.queue_free()
	Globals.end_zone_total = 0
	
	current_level_id = -1
	
	var level_scene = Node2D.new()
	add_child(level_scene)
	current_level = level_scene
