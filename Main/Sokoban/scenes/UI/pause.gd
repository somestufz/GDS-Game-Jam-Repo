extends VBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../LevelManager"

func _on_resume_pressed() -> void:
	ui.animate_to_menu("Game")


func _on_level_select_pressed() -> void:
	ui.animate_to_menu("LevelSelect")

func _on_main_menu_pressed() -> void:
	ui.animate_to_menu("MainMenu")
	level_manager.deload()
