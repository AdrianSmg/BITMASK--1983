extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")
var input = preload("res://Scenes/input.tscn")

func _ready() -> void:
	var pos = Vector2(-480, -360)
	show_dialogue(pos, "Test text: bitmask 1983 the best!!!", font)

	var inputBar = input.instantiate()
	add_child(inputBar)
	inputBar.position = Vector2(-70, 120)

	show_dialogue_speed(pos, r"""$$$$$$$\  $$$$$$\ $$$$$$$$\ $$\      $$\  $$$$$$\   $$$$$$\  $$\   $$\ 
$$  __$$\ \_$$  _|\__$$  __|$$$\    $$$ |$$  __$$\ $$  __$$\ $$ | $$  |
$$ |  $$ |  $$ |     $$ |   $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |$$  / 
$$$$$$$\ |  $$ |     $$ |   $$\$$\$$ $$ |$$$$$$$$ |\$$$$$$\  $$$$$  /  
$$  __$$\   $$ |     $$ |   $$ \$$$  $$ |$$  __$$ | \____$$\ $$  $$<   
$$ |  $$ |  $$ |     $$ |   $$ |\$  /$$ |$$ |  $$ |$$\   $$ |$$ |\$$\  
$$$$$$$  |$$$$$$\    $$ |   $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ | \$$\ 
\_______/ \______|   \__|   \__|     \__|\__|  \__| \______/ \__|  \__|
                                                                                                                                    
      $$\         $$\   $$$$$$\   $$$$$$\   $$$$$$\        $$\            
     $$  |      $$$$ | $$  __$$\ $$  __$$\ $$ ___$$\       \$$\           
    $$  /       \_$$ | $$ /  $$ |$$ /  $$ |\_/   $$ |       \$$\          
   $$  /          $$ | \$$$$$$$ | $$$$$$  |  $$$$$ /         \$$\         
   \$$<           $$ |  \____$$ |$$  __$$<   \___$$\         $$  |        
    \$$\          $$ | $$\   $$ |$$ /  $$ |$$\   $$ |       $$  /         
     \$$\       $$$$$$\\$$$$$$  |\$$$$$$  |\$$$$$$  |      $$  /          
      \__|      \______|\______/  \______/  \______/       \__/                                                                              
	""", font, 0.0000005)
	
	show_dialogue(Vector2(-200, 75), "Type in password to start:", font)

func _on_correct_arg():
	start_game()
	
func _process(delta: float) -> void:
	pass

func show_dialogue(pos, text, _font):
	var bubble = text_scene.instantiate()

	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN_YELLOW)
	bubble.set_font(_font)
	bubble.start_typing()

func show_dialogue_speed(pos, text, _font, speed):
	var bubble = text_scene.instantiate()

	add_child(bubble)

	bubble.position = pos
	bubble.typing_speed = speed
	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN_YELLOW)
	bubble.set_font(_font)
	bubble.start_typing()

func start_game():
	# dialogue day 1
	
	puzzle_day_1()
	
	# dialogue day 2
	
	puzzle_day_2()
	
	# dialogue day 2
	
	puzzle_day_3()
	
	# dialogue day 2
	
	puzzle_day_4()
	
	# ending dialogue
	
	end_screen()

func puzzle_day_1():
	pass
	
func puzzle_day_2():
	pass
	
func puzzle_day_3():
	pass
	
func puzzle_day_4():
	pass
	
func end_screen():
	pass
