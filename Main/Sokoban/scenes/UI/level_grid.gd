extends GridContainer

@onready var level_manager: LevelManager = $"../../../../../LevelManager"
@onready var ui: Control = $"../../.."

@export var level_container: PackedScene

func _ready() -> void:
	show()
	var id := 0
	for level in level_manager.level_names:
		var level_container_instance = level_container.instantiate()
		level_container_instance.set_level(id)
		level_container_instance.connect("level_selected", _on_level_selected)
		add_child(level_container_instance)
		id += 1

func _on_level_selected(id):
	ui.animate_to_menu("Game")
	level_manager.load_to_level(id)
