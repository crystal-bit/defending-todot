extends Node2D

const levelPath = "res://scenes/gameplay/levels/level%d.tscn"

func _ready() -> void:
	pass
	

func pre_start(params):
	if not params.has("level_idx"):
		load_level(1)
	else:
		load_level(params.level_idx)


func start():
	pass


func load_level(level_idx):
	var levelLoad = load(levelPath % level_idx).instance()
	$Level.add_child(levelLoad)
