extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")
var input = preload("res://Scenes/input.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pos = Vector2(0, 0)
	
	var inputBar = input.instantiate()
	add_child(inputBar)
	inputBar.position = Vector2(0, -150)
	
	show_dialogue(pos, "Test text: bitmask 1983 the best!!!", font)

func _on_correct_arg():
	show_dialogue(Vector2(0, -150), "Correct", font)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_dialogue(pos, text, _font):
	var bubble = text_scene.instantiate()
	
	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(_font)
	bubble.start_typing()
