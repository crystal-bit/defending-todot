extends Button

onready var audio = get_node("../AudioStreamPlayer")


func _on_AboutButton_pressed():
	audio.play()
	yield(audio, "finished")
	get_node("../../CanvasLayer/AboutOverlay").show()
