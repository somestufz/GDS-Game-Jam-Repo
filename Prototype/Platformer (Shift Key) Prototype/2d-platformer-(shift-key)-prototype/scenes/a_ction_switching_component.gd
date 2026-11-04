extends Area2D


@export var action_state_dictionary: Dictionary[ActionFlag.Action, Node]

@export var active_action_state:Node


func _ready() -> void:
	for state:Node in action_state_dictionary.values():
		state.process_mode = PROCESS_MODE_DISABLED
	_choose_action(ActionFlag.Action.RUN)


# Choose an active state:
# - Make sure the active action state's process mode is on
# - Disable all the other action states' process mode
func _choose_action(action:ActionFlag.Action) -> void:
	if not active_action_state == null:
		active_action_state.process_mode = Node.PROCESS_MODE_DISABLED
	active_action_state = action_state_dictionary[action]
	active_action_state.process_mode = Node.PROCESS_MODE_INHERIT
	

 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shift_action"):
		#_choose_active_state()
		pass
		
		

# use 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area is ActionFlag:
		var action_flag:ActionFlag = area
		_choose_action(action_flag.action)
