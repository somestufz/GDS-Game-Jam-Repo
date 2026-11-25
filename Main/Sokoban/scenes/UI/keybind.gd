extends MarginContainer

@onready var label: Label = $HBoxContainer/LabelContainer/Label
@onready var button_1: Button = $"HBoxContainer/Button 1/Button"
@onready var button_2: Button = $"HBoxContainer/Button 2/Button"

var action : String

var isListening1 := false
var isListening2 := false

func initialise(action : String) -> void:
	self.action = action
	var text = action.replace("_"," ").capitalize()
	label.text = text
	button_1.text = InputMap.action_get_events(action)[0].as_text().replace(" - Physical", "")
	if InputMap.action_get_events(action).size() > 1:
		button_2.text = InputMap.action_get_events(action)[1].as_text().replace(" - Physical", "")

func _on_button_pressed() -> void:
	isListening1 = true
	isListening2 = false


func _on_button_2_pressed() -> void:
	isListening1 = false
	isListening2 = true


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if isListening1:
			var events = InputMap.action_get_events(action)
			events[0] = event
			#swap out the binding
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, events[0])
			if events.size() > 1:
				InputMap.action_add_event(action, events[1])
			#Sets the buttons text
			button_1.text = events[0].as_text()
			if events.size() > 1:
				button_2.text = events[1].as_text()
			isListening1 = false
		elif isListening2:
			var events = InputMap.action_get_events(action)
			if events.size() == 1:
				events.append(event)
			else:
				events[1] = event
			#swap out the binding
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, events[0])
			InputMap.action_add_event(action, events[1])
			#Sets the buttons text
			button_1.text = events[0].as_text()
			if events.size() > 1:
				button_2.text = events[1].as_text()
			isListening1 = false
