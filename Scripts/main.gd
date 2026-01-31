extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")

func _ready() -> void:
	var pos = Vector2(-480, -370)
	show_dialogue(pos, "Test text: bitmask 1983 the best!!!", font)

	var inputBar = input.instantiate()
	add_child(inputBar)
	inputBar.position = Vector2(-70, 120)

	show_dialoguespeed(pos, r"""$$$$$$$\  $$$$$$\ $$$$$$$$\ $$\      $$\  $$$$$$\   $$$$$$\  $$\   $$\ 
$$  __$$\ _$$  |_$$  |$$$\    $$$ |$$  $$\ $$  __$$\ $$ | $$  |
$$ |  $$ |  $$ |     $$ |   $$$$\  $$$$ |$$ /  $$ |$$ /  _|$$ |$$  / 
$$$$$$$\ |  $$ |     $$ |   $$$$$$ $$ |$$$$$$$$ |$$$$$$\  $$$$$  /
$$  $$\   $$ |     $$ |   $$ $$$  $$ |$$  $$ | _$$\ $$  $$<
$$ |  $$ |  $$ |     $$ |   $$ |$  /$$ |$$ |  $$ |$$\   $$ |$$ |$$\
$$$$$$$  |$$$$$$\    $$ |   $$ | _/ $$ |$$ |  $$ |$$$$$$  |$$ | $$\ 
___/ ___|   _|   _|     _|_|  _| ___/ _|  _|

       $$\         $$\   $$$$$$\   $$$$$$\   $$$$$$\        $$\
      $$  |      $$$$ | $$  $$\ $$  $$\ $$ $$\       $$\
     $$  /       _$$ | $$ /  $$ |$$ /  $$ |_/   $$ |       $$\
    $$  /          $$ | $$$$$$$ | $$$$$$  |  $$$$$ /         $$\
    $$<           $$ |  _$$ |$$  $$<   _$$\         $$  |
     $$\          $$ | $$\   $$ |$$ /  $$ |$$\   $$ |       $$  /
      $$\       $$$$$$\$$$$$$  |$$$$$$  |$$$$$$  |      $$  /
       _|      ___|_/  _/  ___/       _/
	""", font, 0.0000005)
show_dialogue(Vector2(-200, 75), "Type in password to start:", font)

func _on_correct_arg():
	show_dialogue(Vector2(0, -150), "Correct", font) #start game-

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

func show_dialogue_speed(pos, text, _font, speed):
	var bubble = text_scene.instantiate()

	add_child(bubble)

	bubble.position = pos
	bubble.typing_speed = speed
	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN)
	bubble.set_font(_font)
	bubble.start_typing()
