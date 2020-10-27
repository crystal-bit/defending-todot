extends Button

onready var audio = get_node("../AudioStreamPlayer")


func _on_ExitButton_pressed():
	audio.play()
	yield(audio, "finished")
	# gently shutdown the game
	Scenes.main.transitions.fade_in()
	yield(Scenes.main.transitions.anim, "animation_finished")
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().quit()
