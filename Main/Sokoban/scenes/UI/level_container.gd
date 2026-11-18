extends PanelContainer

signal level_selected

@export var level_id : int = 0

@onready var label: Label = $Label

func set_level(value):
	level_id = value
	if not is_inside_tree():
		await ready
	label.text = str(level_id + 1)

func _gui_input(event: InputEvent) -> void:
	print(str(level_id)+": detects an input")
	if event is InputEventMouseButton:
		level_selected.emit(level_id)
