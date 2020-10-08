extends Node2D

onready var level = $Level
const level_path = "res://scenes/gameplay/levels/level%d.tscn"


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
	level.replace_by_instance(load(level_path % level_idx))
