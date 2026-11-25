extends Control

var current_menu := "MainMenu"

@onready var level_manager: LevelManager = $"../../LevelManager"
@onready var transition: AnimationPlayer = $Transition

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
	await transition.animation_finished
	set_current_menu(menu)
	transition.play("out")
	await transition.animation_finished
	transition.play("RESET")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print(current_menu)
		if current_menu == "Game":
			animate_to_menu("Pause")
		elif level_manager.current_level_id != -1:
			animate_to_menu("Game")
