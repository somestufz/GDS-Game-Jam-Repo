extends VBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../LevelManager"


func _on_next_pressed() -> void:
	level_manager.load_next_level()
	ui.animate_to_menu("Game")

func _on_restart_pressed() -> void:
	level_manager.reload_level()
	ui.animate_to_menu("Game")

func _on_main_menu_pressed() -> void:
	ui.animate_to_menu("MainMenu")
	level_manager.deload()
