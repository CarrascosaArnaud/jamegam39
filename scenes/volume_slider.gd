extends HSlider

func on_changed(value: float):
	var volume = -80 if value == 0 else lerp(-25, 10, value / 100)
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"),
		volume
	)
