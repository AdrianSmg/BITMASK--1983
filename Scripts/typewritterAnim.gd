extends Control

@export var typing_speed: float = 0.03

@onready var label: Label = $Label

var _full_text := ""
var _timer := 0.0
var _typing := false

func set_text(text: String):
	_full_text = text
	label.text = text
	label.visible_characters = 0

func set_text_color(color: Color):
	label.add_theme_color_override("font_color", color)

func set_font(font: Font):
	label.add_theme_font_override("font", font)

func start_typing():
	_timer = 0.0
	_typing = true
	label.visible_characters = 0

func kill_instance():
	self.queue_free()


func _process(delta):
	if not _typing:
		return

	_timer += delta

	if _timer >= typing_speed:
		_timer = 0.0
		label.visible_characters += 1

		if label.visible_characters >= _full_text.length():
			_typing = false
