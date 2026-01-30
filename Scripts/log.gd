extends Control

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")

@onready var log_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var input_bar := $inputBar

func _ready():
	input_bar.submitted.connect(_on_input_submitted)
	print("Scroll max:", $ScrollContainer.get_v_scroll_bar().max_value)

func _on_input_submitted(text: String):
	add_log_line(text)

func add_log_line(text: String):
	var bubble = text_scene.instantiate()

	log_container.add_child(bubble) # do not set custom_minimum_size

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(font)
	bubble.start_typing()

	# Wait one frame for layout to update
	await get_tree().process_frame
	await get_tree().process_frame

	# Scroll to bottom
	$ScrollContainer.scroll_vertical = $ScrollContainer.get_v_scroll_bar().max_value
	print("Scroll max:", $ScrollContainer.get_v_scroll_bar().max_value)


	
