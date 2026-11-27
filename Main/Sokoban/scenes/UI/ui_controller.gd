extends Control

var current_menu := "MainMenu"

@onready var level_manager: LevelManager = $"../../LevelManager"
@onready var transition: AnimationPlayer = $Transition

@onready var sfx_stream: AudioStreamPlayer2D = $SfxStream
@onready var swish_stream: AudioStreamPlayer2D = $SwishStream
@export var audio_clips : Array[AudioStream]

func _ready() -> void:
	set_current_menu("MainMenu")

func set_current_menu(menu : String):
	current_menu = menu
	
	for child in get_children():
		if child.name == current_menu:
			child.show()
		else:
			if child is Control:
				child.hide()
	
	

func animate_to_menu(menu : String):
	transition.play("in")
	play_audio(2)
	#play_audio(0)
	await transition.animation_finished
	set_current_menu(menu)
	transition.play("out")
	await transition.animation_finished
	transition.play("RESET")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print(current_menu)
		if current_menu == "Game":
			animate_to_menu("Pause")
		elif level_manager.current_level_id != -1:
			animate_to_menu("Game")

func play_audio(id : int) -> void:
	if len(audio_clips) > 0:
		if id == 2:
			swish_stream.play()
		else:
			sfx_stream.stream = audio_clips[id]
			sfx_stream.play()
