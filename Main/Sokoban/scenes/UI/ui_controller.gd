extends Control

var current_menu := "MainMenu"

@onready var level_manager: LevelManager = $"../LevelManager"

func _ready() -> void:
	set_current_menu("MainMenu")

func set_current_menu(menu : String):
	current_menu = menu
	for child in get_children():
		if child.name == current_menu:
			child.show()
		else:
			child.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print(current_menu)
		if current_menu == "Game":
			set_current_menu("Pause")
		elif level_manager.current_level_id != -1:
			set_current_menu("Game")
