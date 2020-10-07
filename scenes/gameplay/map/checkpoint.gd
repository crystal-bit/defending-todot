extends Node2D

export var sceneLoad = 1
export var checkState = 0
var isSceneLock = true


func _ready():
	if checkState == 0:
		$Area2D/icon0.visible = true
	elif checkState == 1:
		$Area2D/icon1.visible = true
	elif checkState == 2:
		$Area2D/icon2.visible = true
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and checkState != 0:
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
