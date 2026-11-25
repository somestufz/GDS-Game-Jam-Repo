extends VBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../../LevelManager"

func _on_level_select_pressed() -> void:
	ui.animate_to_menu("LevelSelect")


func _on_start_select_pressed() -> void:
	ui.animate_to_menu("Game")
	level_manager.load_to_level(0)

func _on_settings_pressed() -> void:
	ui.animate_to_menu("Settings")
