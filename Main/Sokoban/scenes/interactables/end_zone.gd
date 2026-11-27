class_name EndZone
extends Interactable

func _ready() -> void:
	super()
	Globals.end_zone_total += 1


func player_entered(_body : Node2D) -> void:
	Globals.end_zone_count += 1
	
	play_audio()

func player_exit(_body : Node2D) -> void:
	Globals.end_zone_count -= 1
