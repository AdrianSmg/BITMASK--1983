extends PointLight2D

@export var base_energy := 1.2
@export var pulse_amp := 0.35
@export var pulse_speed := 3.0

func _process(_delta: float) -> void:
	energy = base_energy + sin(Time.get_ticks_msec() / 1000.0 * pulse_speed) * pulse_amp
