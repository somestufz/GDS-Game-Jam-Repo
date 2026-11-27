class_name LevelManager
extends Node2D

var current_level : Node2D
var current_level_id : int = -1

@onready var ui: Control = $"../CanvasLayer/UI"

@export var level_names : Array[String] = [
	"res://scenes/main/levels/level_horse_1.tscn",
	"res://scenes/main/levels/level_horse_2.tscn",
	"res://scenes/main/levels/level_horse_3.tscn"
]

@export var musik : Array[AudioStream]
@export var audio_clips : Array[AudioStream]

@onready var sfx_stream: AudioStreamPlayer2D = $SfxStream
@onready var musik_stream: AudioStreamPlayer2D = $MusikStream


func _ready() -> void:
	current_level = $Level
	
	play_music()
	musik_stream.finished.connect(play_music)

func _process(_delta: float) -> void:
	#print(Globals.end_zone_count, "/", Globals.end_zone_total)
	if Globals.end_zone_count == Globals.end_zone_total and ui.current_menu == "Game":
		ui.set_current_menu("Win")
	
	if Input.is_action_just_pressed("restart") and ui.current_menu == "Game":
		reload_level()

func load_to_level(id : int) -> void:
	print("loading to " + str(id))
	current_level.queue_free()
	Globals.end_zone_total = 0
	
	current_level_id = id
	
	var level_scene = load(level_names[id]) as PackedScene
	var level_scene_instance = level_scene.instantiate()
	add_child(level_scene_instance)
	current_level = level_scene_instance
	
	play_audio(0)

func load_next_level() -> void:
	current_level_id += 1
	load_to_level(current_level_id)

func reload_level() -> void:
	load_to_level(current_level_id)

func deload() -> void:
	print("deloading level")
	current_level.queue_free()
	Globals.end_zone_total = 0
	
	current_level_id = -1
	
	var level_scene = Node2D.new()
	add_child(level_scene)
	current_level = level_scene

func play_audio(id : int) -> void:
	if len(audio_clips) > 0:
		sfx_stream.stream = audio_clips[id]
		sfx_stream.play()

func play_music() -> void:
	musik_stream.stream = musik[randi() % 2]
	musik_stream.play()
