extends Node2D

export var sceneLoad = 1


func _ready():
	pass
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			print(sceneLoad)
			var params = {
				"level_idx": sceneLoad,
				"a_number": 10,
				"a_string": "Ciao mondo!",
				"an_array": [1, 2, 3, 4],
				"a_dict": {
					"name": "test",
					"val": 15
				},
			}
			Game.change_scene("res://scenes/gameplay/gameplay.tscn", params)
