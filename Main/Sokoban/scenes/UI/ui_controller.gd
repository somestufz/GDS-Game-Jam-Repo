extends Control

var current_menu := "MainMenu"

func _ready() -> void:
	set_current_menu("MainMenu")

func set_current_menu(menu : String):
	current_menu = menu
	for child in get_children():
		if child.name == current_menu:
			child.show()
		else:
			child.hide()
