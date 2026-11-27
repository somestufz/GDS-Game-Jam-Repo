extends HBoxContainer

@onready var label: Label = $Label
@onready var h_slider: HSlider = $HSlider
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioServer.set_bus_volume_linear(0, db_to_linear(0))
	h_slider.value = db_to_linear(0)
	audio_stream_player.volume_db = -10000000
	audio_stream_player.play()

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(0, db_to_linear(value))
	label.text = str(int(h_slider.ratio * 100)) + "%"

func _on_h_slider_drag_started() -> void:
	audio_stream_player.volume_db = 0

func _on_h_slider_drag_ended(_value_changed: bool) -> void:
	audio_stream_player.volume_db = -10000000
