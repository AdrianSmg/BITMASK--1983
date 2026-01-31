extends Node

@onready var input_line: LineEdit = %InputLine
@onready var typewriter: Control = %Typewriter

func _ready() -> void:
	input_line.grab_focus()

func _on_input_line_text_submitted(new_text: String) -> void:
	var cmd := new_text.strip_edges()

	%Typewriter.type_append("> " + cmd + "\n")

	input_line.clear()

	# 👇 foco en el siguiente tick (evita que se lo “roben”)
	input_line.call_deferred("grab_focus")
