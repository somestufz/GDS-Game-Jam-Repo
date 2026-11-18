extends VBoxContainer

@onready var ui: Control = $".."

func _on_start_pressed() -> void:
	ui.set_current_menu("LevelSelect")
