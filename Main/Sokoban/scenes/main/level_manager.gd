extends Node2D

var current_level : Node2D
var current_level_id : int

@export var level_names : Array[String] = [
	"res://scenes/main/levels/level_horse_1.tscn",
	"res://scenes/main/levels/level_horse_2.tscn",
	"res://scenes/main/levels/level_horse_3.tscn"
]

func _ready() -> void:
	current_level_id = 0
	current_level = $Level
	load_to_level(current_level_id)

func load_to_level(id : int) -> void:
	current_level.queue_free()
	
	var level_scene = load(level_names[id]) as PackedScene
	var level_scene_instance = level_scene.instantiate()
	add_child(level_scene_instance)
	current_level = level_scene_instance
