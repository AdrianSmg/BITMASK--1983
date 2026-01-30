extends Control

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
	if text.is_empty():
		return
	
	if(text == "hola"):
		show_dialogue(Vector2(0, -50), "Correct\nCorrect", font)
	else:
		show_dialogue(Vector2(0, -50), "Incorrect\nIncorrect", font)
		
	input.clear()
	input.grab_focus()
