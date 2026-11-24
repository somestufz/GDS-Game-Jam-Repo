extends MarginContainer

@onready var label: Label = $HBoxContainer/LabelContainer/Label
@onready var button_1: Button = $"HBoxContainer/Button 1/Button"
@onready var button_2: Button = $"HBoxContainer/Button 2/Button"

var action : String

func initialise(action : String) -> void:
	self.action = action
	label.text = action
	button_1.text = InputMap.action_get_events(action)[0].to_string()
	if InputMap.action_get_events(action).size() > 1:
		button_2.text = InputMap.action_get_events(action)[1].to_string()
