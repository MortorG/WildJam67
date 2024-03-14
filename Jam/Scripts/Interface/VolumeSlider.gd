extends HSlider

@export
var bus_index: Enums.BusIndex

func _ready():
	value = linear_to_db(AudioServer.get_bus_volume_db(bus_index))
	
	value_changed.connect(func (new_value: float):
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(new_value))
	)
