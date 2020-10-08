extends Node2D

export var scene_load = 1
export var check_state = 0


func _ready():
	if check_state == 0:
		$Area2D/icon0.texture = load("res://assets/sprites/map/checkLock.png")
	elif check_state == 1:
		$Area2D/icon0.texture = load("res://assets/sprites/map/checkToDo.png")
	elif check_state == 2:
		$Area2D/icon0.texture = load("res://assets/sprites/map/checkDone.png")
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and check_state != 0:
			var params = {
				"level_idx": scene_load,
			}
			Game.change_scene("res://scenes/gameplay/gameplay.tscn", params)
