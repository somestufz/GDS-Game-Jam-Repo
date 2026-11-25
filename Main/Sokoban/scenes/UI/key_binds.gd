extends VBoxContainer

@export var keybind : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var actions = InputMap.get_actions()
	for action in actions:
		if not "ui_" in action:
			var bind = keybind.instantiate()
			add_child(bind)
			bind.initialise(action)
