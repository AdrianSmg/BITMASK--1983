extends Control

@onready var input: LineEdit = $Input
var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")

var correct_psw = false

func _ready():
	input.grab_focus()
	
func _on_input_text_submitted(text: String) -> void:
	if text.is_empty():
		return
	
	if(text == "lenin4ever"):
		correct_psw = true
	else:
		show_dialogue(Vector2(-175, 100), "Incorrect", font)
		correct_psw = false
		
	input.clear()
	input.grab_focus()

func psw() -> bool:
	return correct_psw

func show_dialogue(pos, text, _font):
	var bubble = text_scene.instantiate()
	
	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(_font)
	bubble.start_typing()
