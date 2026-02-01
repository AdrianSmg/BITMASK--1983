extends Node2D

var text_scene = preload("res://Scenes/text.tscn")
var font = preload("res://Fonts/osc_mono.ttf")
var input = preload("res://Scenes/input.tscn")

var inputBar = input.instantiate()
var objArray: Array = []
var arrIndex = 0

var game_started = false
var game_over := false

var arrayCorrect: Array[int] = []
var onPuzzle = false

# Puzzle global vars:
var puzzle_numbers: Array = []
var puzzle_resolved_current := false
var puzzle_index := 0
var puzzle_active := false
var puzzle_timer := 0.0
var puzzle_time_limit := 0.0
var puzzle_bubble = null


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
	""", font, Color.GREEN_YELLOW, 250)
	
	show_dialogue_speed(Vector2(-200, 75), "Type in password to start:", font, Color.GREEN_YELLOW, 200)

	
func _process(delta: float) -> void:
	if (inputBar.psw() and not game_started):
		game_started = true
		start_game()

	if puzzle_active:
		if Input.is_action_just_pressed("yes"):
			_resolve_puzzle(true)
			return
		puzzle_timer += delta
		if puzzle_timer >= puzzle_time_limit:
			_resolve_puzzle(false)

func show_dialogue(pos, text, _font, _color, time):
	var bubble = text_scene.instantiate()
	bubble.add_to_group("bubbles")

	add_child(bubble)

	bubble.position = pos

	bubble.set_text(text)
	bubble.set_text_color(_color)
	bubble.set_font(_font)
	bubble.start_typing()
	
	await get_tree().create_timer(time).timeout
	bubble.kill_instance()

func show_dialogue_speed(pos, text, _font, _color, speed):
	var bubble = text_scene.instantiate()
	bubble.add_to_group("bubbles")
	
	objArray.append(bubble)
	arrIndex += 1
	
	add_child(bubble)

	bubble.position = pos
	bubble.chars_per_second = speed
	bubble.set_text(text)
	bubble.set_text_color(_color)
	bubble.set_font(_font)
	bubble.start_typing()

func show_dialogue_hold(pos, text, _font, _color):
	var bubble = text_scene.instantiate()
	bubble.add_to_group("bubbles")
	add_child(bubble)

	bubble.position = pos
	bubble.set_text(text)
	bubble.set_text_color(_color)
	bubble.set_font(_font)
	bubble.start_typing()

	return bubble

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
""", font, Color.GREEN_YELLOW, 7)	

	var d = show_dialogue_hold(Vector2(-470, -300), r"""[GLadUS] 
	Welcome to Bunker ZASLON-4, Comrade Operator #744.

I see you found the chair. Good. 
It is still warm from Operator #733. 
He was... "reassigned" to count snowflakes in Siberia this morning. 
Try to last longer than he did. At least until lunch.
  
Your mission is simple:
The Americans are flooding our frequencies with noise, propaganda, 
and jazz music. Your terminal is the only filter between their lies 
and the Motherland.

Press INTRO to continue
""", font, Color.RED)

	await wait_for_input()
	d.kill_instance()

	d = show_dialogue_hold(Vector2(-470, -300), r"""[GLadUS]
	They think they are safe.
But they do not know about the BITMASK protocol.

You are not here to listen, Comrade. 
You are here to UNMASK the enemy. 

We do not pay you to think. We pay you to make the MASK absolute.
Actually, we do not pay you at all. But the beet soup is free.

Are you ready to serve? [Y/N]
""", font, Color.RED)

	await wait_for_input()
	d.kill_instance()
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""==========================================
DAY: 01   |   OCTOBER 24, 1983
==========================================

The radar is picking up a storm on the border. 
But intelligence says the Americans are hiding STRATEGIC BOMBERS 
inside the storm clouds.

We need to filter the rain from the rockets.

> YOUR WEAPON:   The [ AND ] Mask.
> YOUR CONFIG:   11110000
> THE ENEMY:     Any signal starting with [ 1111 ].

Press INTRO to continue
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""THE LOGIC IS SIMPLE:
If (SIGNAL ** AND ** MASK) between your config and the rain config
gives a result starting with 1111...
...it is a Bomber. SHOOT IT DOWN.

If the result is anything else... let it pass. 
Do not shoot the birds. Ammo is expensive.

Press INTRO to START
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()

	puzzle_day_1()
	await wait_for_puzzle_end()
	if game_over:
		return
	
	await show_dialogue(Vector2(-470, -300), r""":: DAY 01 REPORT ::
STATUS: SUCCESSFUL.

Not bad, Operator. The sky is clear of bombers. 
Intelligence reports that the Americans are confused. 
They think our radar is better than it actually is. 
Good. Let them be afraid.

Go to your bunk. Sleep fast. 
Tomorrow we stop defending... and start infiltrating.

> SYSTEM SHUTDOWN...
""", font, Color.GREEN_YELLOW, 9)	
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""==========================================
DAY: 02   |   OCTOBER 25, 1983
==========================================

The border is locked down. 
We have undercover agents trying to return home, but the automated 
turrets are set to destroy anything without "General Clearance".

Our agents are disguised as static noise, carrying the ID suffix [0011].
We must give them a fake clearance badge so they can pass safely.

> YOUR WEAPON:   The [ OR ] Mask.
> YOUR CONFIG:   11110000
> THE ALLY:    Any signal ending with [ 0011 ].

Press INTRO to continue
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""THE LOGIC IS SIMPLE:
The [ OR ] Mask forces bits to be 1. It does not erase, it overwrites.
We will use it to INJECT the "General Clearance" header [ 1111 ] onto our spies.

If (SIGNAL ** OR ** MASK) creates a valid clearance...
...it is a Spy. GRANT ACCESS.

If the signal does not end in [ 0011 ], do not mask it. 
It is just garbage. Let it burn.

Press INTRO to BEGIN INFILTRATION.
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()
	
	puzzle_day_2()
	await wait_for_puzzle_end()
	if game_over:
		return
	
	await show_dialogue(Vector2(-470, -300), r""":: DAY 02 REPORT ::
STATUS: SUCCESSFUL.

The agents have crossed the line.
They are wearing the masks you gave them.
Rest now, Operator.

> SYSTEM SHUTDOWN...
""", font, Color.GREEN_YELLOW, 5)	
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""==========================================
DAY: 03   |   OCTOBER 26, 1983
==========================================

The enemy has realized we are filtering their planes and masking our spies.
So they have changed tactics. They are now using OUR codes.

They are mimicking our "Friendly ID" signature to bypass the defenses. 
Visually, they look like us. But digitally, there are flaws in their disguise.

We must compare every signal against the Official Truth.

> YOUR WEAPON:   The [ XOR ] Mask.
> YOUR CONFIG:   10101010  (The Official Friendly ID)
> THE ENEMY:     Any signal that is NOT a perfect match.

Press INTRO to continue
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""The [ XOR ] Mask is the Difference Detector.
It will show a [ 1 ] only where the signal lies (where it differs from the Config).

If (SIGNAL ** XOR ** MASK) results in absolute zero [ 00000000 ]...
...it is a Comrade. LET IT PASS.

If the result shows even a single [ 1 ]...
...it is an Impostor wearing our face. SHOOT IT DOWN.

Press INTRO to BEGIN VERIFICATION
""", font, Color.GREEN_YELLOW)

	await wait_for_input()
	d.kill_instance()
	
	puzzle_day_3()
	await wait_for_puzzle_end()
	if game_over:
		return
	
	await show_dialogue(Vector2(-470, -300), r""":: DAY 03 REPORT ::
STATUS: SUCCESSFUL.

Paranoia is a useful tool, Operator.
You destroyed 6 aircraft that looked exactly like ours. 
If you had hesitated for a microsecond, ZASLON-4 would be a crater.
Check your equipment. Tomorrow, the signal changes frequency.

> SYSTEM SHUTDOWN...
""", font, Color.GREEN_YELLOW, 6)	
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""==========================================
DAY: 04   |   OCTOBER 27, 1983
STATUS:   CRITICAL FAILURE
==========================================

:: SYSTEM ALERT ::
The firewall is gone. The ZASLON-4 barrier has collapsed.
It is not the Americans. It never was.
The signal is coming from BENEATH the bunker.

The screen is bleeding code. The logic is inverted.
Truth is Lie. Lie is Truth.
We must purge the memory buffer before IT wakes up.

> YOUR WEAPON:   The BITMASK Protocol.
> YOUR CONFIG:   11111111 (The Inverter).
> THE ENEMY:     EVERYTHING.

Press INTRO to continue
""", font, Color.ORANGE_RED)

	await wait_for_input()
	d.kill_instance()
	
	d = show_dialogue_hold(Vector2(-470, -300), r"""THE LOGIC IS ABSOLUTE:
We must kill the signal by inverting its polarity.
Use [ XOR ] with [ 11111111 ] to turn the signal against itself.

If (SIGNAL ** XOR ** 11111111) creates a result...
...it is purged.

DO NOT HESITATE.
DO NOT READ THE PATTERNS.
PURGE IT ALL.

Press INTRO to BEGIN FINAL SEQUENCE
""", font, Color.ORANGE_RED)

	await wait_for_input()
	d.kill_instance()
	
	puzzle_day_4()
	await wait_for_puzzle_end()
	if game_over:
		return
	
	await show_dialogue(Vector2(-470, -300), r""":: SYSTEM REPORT ::
STATUS: ...SILENCE.

The buffer is empty. The signal is dead.
But the bunker is dark.
And I cannot hear the ventilation anymore.

Operator?
Are you still there?

Did we win?
Or did we just turn off the lights?

...
...

[ CONNECTION LOST ]
[ ZASLON-OS SHUTTING DOWN ]

THANKS FOR PLAYING.
BITMASK: 1983
""", font, Color.SKY_BLUE, 15)	
	
	end_screen()
	return

func puzzle_day_1():
	arrayCorrect = [0,0,1,1,0,0,1,0,0,0]
	
	puzzle([ "00001101",
			"00110101",
			"11110001", # TARGET
			"11111111", # TARGET
			"01010101",
			"10110000",
			"11110000", # TARGET
			"11110100",
			"00000000",
			"11101111",
			], 3)
	
func puzzle_day_2():
	arrayCorrect = [0,1,0,1,0,1,0,1,0,1]
	
	puzzle([
		"00000101",
		"00000011", # TARGET
		"00100000",
		"01010011", # TARGET
		"11110000",
		"00000011", # TARGET
		"00001111",
		"10000011", # TARGET
		"01100110",
		"00110011", # TARGET
	], 3)


func puzzle_day_3():

	arrayCorrect = [0,1,1,0,1,0,1,1,1,0]
	
	puzzle([
		"10101010",
		"10101011", # TARGET
		"11101010", # TARGET
		"10101010",
		"00101010", # TARGET
		"10101010",
		"11111111", # TARGET
		"10101000", # TARGET
		"00000000", # TARGET
		"10101010",
	], 3)


func puzzle_day_4():

	arrayCorrect = [1,1,1,1,1,1,1,1,1]
	
	puzzle([
		"11111111", # TARGET
		"00000000", # TARGET
		"10101010", # TARGET
		"01010101", # TARGET
		"11001100", # TARGET
		"00110011", # TARGET
		"11110000", # TARGET
		"00001111", # TARGET
		"01100110", # TARGET
	], 3)

	

func puzzle(arrayNumbers: Array, timePerNum: float) -> void:
	puzzle_numbers = arrayNumbers
	puzzle_index = 0
	puzzle_timer = 0.0
	puzzle_time_limit = timePerNum
	puzzle_active = true
	onPuzzle = true

	_show_current_number()

func _show_current_number() -> void:

	if puzzle_index >= puzzle_numbers.size():
		puzzle_active = false
		onPuzzle = false

		if is_instance_valid(puzzle_bubble):
			puzzle_bubble.kill_instance()
		return

	if is_instance_valid(puzzle_bubble):
		puzzle_bubble.kill_instance()

	puzzle_bubble = show_dialogue_hold(
		Vector2(-50, -50),
		str(puzzle_numbers[puzzle_index]),
		font,
		Color.GREEN_YELLOW
	)

	puzzle_timer = 0.0
	puzzle_resolved_current = false

func _resolve_puzzle(pressed_intro: bool) -> void:
	
	if puzzle_resolved_current:
		return
	puzzle_resolved_current = true

	var player_value: int = 1 if pressed_intro else 0
	var expected_value: int = arrayCorrect[puzzle_index]

	if player_value != expected_value:
		fail_puzzle()
		return

	puzzle_index += 1
	_show_current_number()
	
func wait_for_puzzle_end() -> void:
	while puzzle_active:
		await get_tree().process_frame
		
func clear_all_text_bubbles() -> void:
	for b in get_tree().get_nodes_in_group("bubbles"):
		if is_instance_valid(b) and b.has_method("kill_instance"):
			b.kill_instance()
		elif is_instance_valid(b):
			b.queue_free()

	puzzle_bubble = null

func defeat_screen():
	clear_all_text_bubbles()
	var title = show_dialogue_speed(
	Vector2(-470, -300),
	r"""░▒▓█▓▒░▒▓████▓▒░░▒▓█▓▒░▒▓██▓▒░░▒▓█▓▒░▒▓█▓▒░
▒▓██▓▒░░▒▓█▓▒░▒▓▒░▒▓▒░░▒▓█▓▒░▒▓██▓▒░░▒▓▒░▒▓
░▒▓▒░▒▓█▓▒░░▒▓▒░▒▓██▓▒░░▒▓▒░▒▓█▓▒░▒▓██▓▒░░▒
▒▓█▓▒░▒▓▒░▒▓██▓▒░░▒▓▒░▒▓█▓▒░▒▓▒░▒▓█▓▒░▒▓██▓
░▒▓██▓▒░░▒▓▒░▒▓█▓▒░▒▓██▓▒░░▒▓▒░▒▓██▓▒░▒▓▒░▒
▒▓▒░▒▓█▓▒░▒▓██▓▒░░▒▓▒░▒▓█▓▒░▒▓▒░▒▓█▓▒░▒▓██▓
░▒▓█▓▒░▒▓▒░▒▓█▓▒░▒▓██▓▒░░▒▓█▓▒░▒▓▒░▒▓█▓▒░▒▓
""",
	font,
	Color.RED,
	250
)
	
	var subtitle = show_dialogue_hold(Vector2(-470, -40), r""":: CRITICAL FAILURE ::
STATUS: COMPROMISED.

You failed to maintain the Mask, Operator.
The signal has breached the firewall.

Your file has been marked: [ INCOMPETENT ].
Operator #735 has been summoned to replace you.

Goodbye, Comrade.
""", font, Color.RED)
	var exit = show_dialogue_hold(Vector2(-160,180), "ACCEPT YOUR FATE? [Y/Y] ", font, Color.ORANGE_RED)
	
	await wait_for_input()
	get_tree().quit()

func end_screen():
	pass

func correct_screen():
	show_dialogue(Vector2(-50, -200), r"""⣰⣾⣿⣿⣿⣷⣦⠀
										⣾⣿⣿⣿⣿⣿⢟⣿⣧
										⣿⣿⡻⣿⡟⣡⣿⣿⣿
										⢻⣿⣿⣦⣾⣿⣿⣿⡟
										⠀⠹⢿⣿⣿⣿⡿⠟⠀""", font, Color.GREEN, 2)
	
func _on_input_mgr_input_sent(key: Variant) -> void:
	return

func fail_puzzle():
	game_over = true
	puzzle_active = false
	onPuzzle = false
	defeat_screen()
	
func wait_for_input():
	while true:
		await get_tree().process_frame
		if Input.is_action_just_pressed("yes"):
			await get_tree().process_frame 
			return
