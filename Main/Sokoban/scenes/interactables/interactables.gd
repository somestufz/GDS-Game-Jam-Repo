class_name Interactable
extends Area2D

var tile_size = 100

func _ready() -> void:
	body_entered.connect(body_entered_interact)
	body_exited. connect(body_exit_interact)

func body_entered_interact(body : Node2D) -> void:
	if body is Player:
		player_entered(body)
	elif body is Item:
		item_entered(body)

func body_exit_interact(body : Node2D) -> void:
	if body is Player:
		player_exit(body)
	elif body is Item:
		item_exit(body)

func player_entered(body : Node2D) -> void:
	pass

func item_entered(body : Node2D) -> void:
	pass

func player_exit(body : Node2D) -> void:
	pass

func item_exit(body : Node2D) -> void:
	pass
