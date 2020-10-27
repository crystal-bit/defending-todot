extends Button

onready var audio = get_node("../AudioStreamPlayer")


func _ready():
	# needed for gamepads to work
	grab_focus()


func _on_Button_pressed():
	audio.play()
	yield(audio, "finished")
	var params = {
		"a_number": 10,
		"a_string": "Ciao mondo!",
		"an_array": [1, 2, 3, 4],
		"a_dict": {
			"name": "test",
			"val": 15
		},
	}
	Game.change_scene("res://scenes/gameplay/map/map.tscn", params)
