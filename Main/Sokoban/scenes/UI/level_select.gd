extends HBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../LevelManager"

func _on_back_pressed() -> void:
	if level_manager.current_level_id == -1:
		ui.animate_to_menu("MainMenu")
	else:
		ui.animate_to_menu("Pause")
