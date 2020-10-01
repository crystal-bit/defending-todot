extends Node2D


onready var level_placeholder = $LevelPlaceholder


func _ready() -> void:
	pass
	

func pre_start(params):
	if not params.has("level_idx"):
		load_level(1)


func start():
	pass


func load_level(level_idx):
	# TODO: update to honor level_idx
	level_placeholder.replace_by_instance()
