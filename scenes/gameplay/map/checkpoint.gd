extends Node2D

onready var icon_cp = $Area2D/IconCP
onready var stars_cp = $Area2D/StarsCP
onready var anim = $AnimationPlayer
onready var level_selected_audio = $LevelSelectedAudio
onready var level_locked = $LevelLocked
onready var pressed = $Pressed

const check_lock = "res://assets/sprites/map/checkLock.png"
const check_todo = "res://assets/sprites/map/checkToDo.png"
const check_done = "res://assets/sprites/map/checkDone.png"
const n_star = "res://assets/sprites/map/star%d.png"
const level_path = "res://scenes/gameplay/levels/level%d.tscn"

enum CHECKPOINT_STATE {
	LOCKED,
	TODO,
	DONE
}

export var scene_load = 1
export(CHECKPOINT_STATE) var check_state = CHECKPOINT_STATE.LOCKED

func _ready():
	match check_state:
		CHECKPOINT_STATE.LOCKED:
			icon_cp.texture = load(check_lock)
			stars_cp.visible = false
		CHECKPOINT_STATE.TODO:
			icon_cp.texture = load(check_todo)
			stars_cp.visible = false
		CHECKPOINT_STATE.DONE:
			icon_cp.texture = load(check_done)
			if Game.n_stars_level.size() >= scene_load:
				stars_cp.texture = load(n_star % Game.n_stars_level[scene_load - 1])
				stars_cp.visible = true
		_:
			pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			load_level()


func load_level():
	Scenes.main.lock_input_until_scene_changed = true
	if check_state != 0:
		var params = {
			"level_path": level_path % scene_load,
		}
		MenuBackgroundMusic.fade_out()
		level_selected_audio.play()
		pressed.play()
		anim.play("pressed")
		yield(level_selected_audio, "finished")
		Game.change_scene("res://scenes/gameplay/gameplay.tscn", params)
	else:
		level_locked.play()
