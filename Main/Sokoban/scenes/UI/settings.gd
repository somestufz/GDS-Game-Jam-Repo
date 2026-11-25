extends HBoxContainer

@onready var ui: Control = $".."
@onready var level_manager: LevelManager = $"../../LevelManager"

func _on_back_pressed() -> void:
	ui.animate_to_menu("MainMenu")
