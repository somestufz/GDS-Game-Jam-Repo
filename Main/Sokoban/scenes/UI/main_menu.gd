extends VBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../LevelManager"

func _on_level_select_pressed() -> void:
	ui.set_current_menu("LevelSelect")


func _on_start_select_pressed() -> void:
	ui.set_current_menu("Game")
	level_manager.load_to_level(0)
