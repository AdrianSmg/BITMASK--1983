extends Control

signal submitted
@onready var input: LineEdit = $Input

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")

func _ready():
	input.grab_focus()
	
func show_dialogue(pos, text, _font):
	var bubble = text_scene.instantiate()
	
	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(_font)
	bubble.start_typing()
	



func _on_input_text_submitted(text: String) -> void:
	submitted.emit(text)
	
	input.clear()
	input.grab_focus()
