extends Button

@onready var audio = get_node("../AudioStreamPlayer")


func _on_CreditButton_pressed():
	audio.play()
	await audio.finished
	Game.change_scene_to_file("res://scenes/credits.tscn")
