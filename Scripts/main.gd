extends Node2D

@onready var typewriter = %Typewriter

func _ready() -> void:
	typewriter.type_append("Hola\n")

func _on_correct_arg() -> void:
	typewriter.type_append("Correct\n")
