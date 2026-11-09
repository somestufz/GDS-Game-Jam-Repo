class_name EndZone
extends Interactable

func _ready() -> void:
	super()
	Globals.end_zone_total += 1


func player_entered(body : Node2D) -> void:
	Globals.end_zone_count += 1

func player_exit(body : Node2D) -> void:
	Globals.end_zone_count += 1
