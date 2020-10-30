extends Control

onready var label := $PanelContainer/Label
const MAX_HP = 100


func set_hp(value: int):
	label.text = str(value)


func reduce_by(value):
	var new_value = int(label.text) - value
	if new_value <= 0:
		# make sure that the current level is in the "Level" group
		var level_node: Node = get_tree().get_nodes_in_group("Levels")[0]
		Game.change_scene("res://scenes/gameplay/game-over-layer/game-over-layer.tscn",
		 {
			"current_level_scene_path": level_node.filename
		})
	label.text = str(clamp(new_value, 0, MAX_HP))
