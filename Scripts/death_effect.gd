extends CanvasLayer

@onready var anim_player = $AnimationPlayer

func play_death_effect():
	# Slow down time slightly for impact
	Engine.time_scale = 0.5
	
	# Play the flash
	anim_player.play("death_flash")
	
	# Wait a moment, then return time to normal
	await get_tree().create_timer(0.2).timeout
	Engine.time_scale = 1.0
	
