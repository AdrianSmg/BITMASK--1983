extends CanvasLayer

@onready var anim_player = $AnimationPlayer

func play_death_effect():
	
	Engine.time_scale = 0.5
	anim_player.play("death_flash")
	await get_tree().create_timer(0.2).timeout
	Engine.time_scale = 1.0
	
