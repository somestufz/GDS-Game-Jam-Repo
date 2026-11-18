extends HBoxContainer

@onready var ui: Control = $".."

func _on_back_pressed() -> void:
	ui.set_current_menu("MainMenu")
