extends CanvasLayer

var level_to_load

func _ready():
	$ColorRect/Buttons/Yes.text = tr("Yes")


func pre_start(params):
	if params.has("current_level_scene_path"):
		level_to_load = params.current_level_scene_path



func _on_Yes_pressed() -> void:
	Game.change_scene("res://scenes/gameplay/gameplay.tscn", {
		"level_path": level_to_load
		})
