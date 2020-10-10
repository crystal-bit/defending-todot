extends Node2D

onready var icon_cp = $Area2D/IconCP
onready var stars_cp = $Area2D/StarsCP

const check_lock = "res://assets/sprites/map/checkLock.png"
const check_todo = "res://assets/sprites/map/checkToDo.png"
const check_done = "res://assets/sprites/map/checkDone.png"
const n_star = "res://assets/sprites/map/star%d.png"

export var scene_load = 1
export var check_state = 0

func _ready():
	if check_state == 0:
		icon_cp.texture = load(check_lock)
		stars_cp.visible = false
	elif check_state == 1:
		icon_cp.texture = load(check_todo)
		stars_cp.visible = false
	elif check_state == 2:
		icon_cp.texture = load(check_done)
		if Game.n_stars_level.size() >= scene_load :
			stars_cp.texture = load(n_star % Game.n_stars_level[scene_load - 1])
			stars_cp.visible = true
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and check_state != 0:
			var params = {
				"level_idx": scene_load,
			}
			Game.change_scene("res://scenes/gameplay/gameplay.tscn", params)
