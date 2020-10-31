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
const star_texture_path = "res://assets/sprites/map/star%d.png"
const level_path = "res://scenes/gameplay/levels/level%d.tscn"

enum CHECKPOINT_STATE {
	LOCKED, # 0
	TODO, # 1
	DONE # 2
}

export var scene_load = 1
export(CHECKPOINT_STATE) var check_state = CHECKPOINT_STATE.LOCKED
var stars = -1

func _ready():
	load_checkpoints_state()
	update_checkopoints_gfx()


func load_checkpoints_state():
	var data = Game.levels[scene_load - 1]
	check_state = data.state
	stars = data.star_rating


func update_checkopoints_gfx():
	match check_state:
		CHECKPOINT_STATE.LOCKED:
			icon_cp.texture = load(check_lock)
			stars_cp.visible = false
		CHECKPOINT_STATE.TODO:
			icon_cp.texture = load(check_todo)
			stars_cp.visible = false
		CHECKPOINT_STATE.DONE:
			icon_cp.texture = load(check_done)
			if stars >= 0 and stars <= 3:
				stars_cp.texture = load(star_texture_path % stars)
				stars_cp.visible = true
		_:
			pass



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			load_level()


func load_level():
	if check_state != 0:
		Scenes.main.lock_input_until_scene_changed = true
		var params = {
			"level_path": level_path % scene_load,
		}
		Game.current_level = scene_load
		MenuBackgroundMusic.fade_out()
		level_selected_audio.play()
		pressed.play()
		anim.play("pressed")
		yield(level_selected_audio, "finished")
		Game.change_scene("res://scenes/gameplay/gameplay.tscn", params)
	else:
		level_locked.play()
