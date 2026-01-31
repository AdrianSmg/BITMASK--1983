extends Control

@export var typing_speed: float = 0.03

@onready var output_scroll: ScrollContainer = %OutputScroll
@onready var output: RichTextLabel = %Output

var _full_text := ""
var _timer := 0.0
var _typing := false

func _update_output_size_and_scroll() -> void:
	# Espera a que el RichTextLabel recalcule el contenido
	await get_tree().process_frame

	# Fuerza a que el hijo "mida" lo que ocupa su contenido
	# (esto hace que el ScrollContainer tenga overflow real)
	output.custom_minimum_size.y = output.get_content_height()

	# Espera a que el ScrollContainer actualice su scrollbar
	await get_tree().process_frame
	output_scroll.scroll_vertical = output_scroll.get_v_scroll_bar().max_value

func type_append(text: String) -> void:
	_full_text = output.text + text
	output.text = _full_text

	# revela SOLO lo nuevo
	output.visible_characters = _full_text.length() - text.length()

	_timer = 0.0
	_typing = true
	_update_output_size_and_scroll()

func _process(delta: float) -> void:
	if not _typing:
		return

	_timer += delta
	if _timer >= typing_speed:
		_timer = 0.0
		output.visible_characters += 1
		_update_output_size_and_scroll()

		if output.visible_characters >= _full_text.length():
			_typing = false
