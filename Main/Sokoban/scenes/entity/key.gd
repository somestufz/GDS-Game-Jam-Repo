class_name Key
extends Item

@onready var audio_stream_key: AudioStreamPlayer2D = $AudioStreamPlayerKey

func push_extra_check(collider):
	if collider == null:
		return null
	elif collider.is_in_group("Locked"):
		collider.unlock()
		global_position = Vector2(10000,10000)
		play_audio()

func play_audio_move() -> void:
	audio_stream_player.play()

func play_audio() -> void:
	audio_stream_key.play()
