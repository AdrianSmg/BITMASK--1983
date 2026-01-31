extends Node

signal input_sent(key)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("yes"):
		input_sent.emit(1)
	if Input.is_action_just_pressed("no"):
		input_sent.emit(0)
