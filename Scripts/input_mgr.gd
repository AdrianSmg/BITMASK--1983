extends Node

signal input_sent(key)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("yes"):
		input_sent.emit(1)
	if Input.is_action_just_pressed("no"):
		input_sent.emit(0)
