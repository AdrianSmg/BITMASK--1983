extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")
var input = preload("res://Scenes/input.tscn")

var inputBar = input.instantiate()
var objArray = [null, null]
var arrIndex = 0

var game_started = false

func _ready() -> void:
	var pos = Vector2(-480, -360)

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
	
	show_dialogue_speed(Vector2(-200, 75), "Type in password to start:", font, 0.03)

	
func _process(delta : float) -> void:
	if (inputBar.psw() and not game_started):
		game_started = true
		start_game()

func show_dialogue(pos, text, _font, _color, time):
	var bubble = text_scene.instantiate()

	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(_color)
	bubble.set_font(_font)
	bubble.start_typing()
	
	await get_tree().create_timer(time).timeout
	bubble.kill_instance()

func show_dialogue_speed(pos, text, _font, speed):
	var bubble = text_scene.instantiate()
	
	objArray[arrIndex] = bubble
	arrIndex += 1
	
	add_child(bubble)

	bubble.position = pos
	bubble.typing_speed = speed
	bubble.set_text(text)
	bubble.set_text_color(Color.GREEN_YELLOW)
	bubble.set_font(_font)
	bubble.start_typing()

func start_game():
	
	# dialogue day 1

	if is_instance_valid(objArray[0]):
		objArray[0].kill_instance()
		
	if is_instance_valid(objArray[1]):
		objArray[1].kill_instance()
	if (is_instance_valid(inputBar)) : 
		inputBar.visible = false
	await show_dialogue(Vector2(-470, -300), r"""[ ZASLON-OS v4.1 (1983) ]
> MEMORY CHECK... 64KB OK.
> LOYALTY CHECK... 100% OK.
> HEATING MODULE... [ FAILURE ] (Wear a coat).
> CONNECTING TO CENTRAL COMMAND... 
...             
...              

[ CONNECTION ESTABLISHED ]
""", font, Color.GREEN_YELLOW, 13)	

	await show_dialogue(Vector2(-470, -300), r"""Welcome to Bunker ZASLON-4, Comrade Operator #744.

I see you found the chair. Good. 
It is still warm from Operator #733. 
He was... "reassigned" to count snowflakes in Siberia this morning. 
Try to last longer than he did. At least until lunch.""", font, Color.RED, 20)


	puzzle_day_1()
	
	# dialogue day 2
	
	puzzle_day_2()
	
	# dialogue day 2
	
	puzzle_day_3()
	
	# dialogue day 2
	
	puzzle_day_4()
	
	# ending dialogue
	
	end_screen()
	return

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
	
