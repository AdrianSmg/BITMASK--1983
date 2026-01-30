extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_dialogue("Test text: bitmask 1983 the best!!!", font)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func show_dialogue(text, font):
	var bubble = text_scene.instantiate()
	
	add_child(bubble)

	bubble.position = Vector2(-100, 0)

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(font)
	bubble.start_typing()
