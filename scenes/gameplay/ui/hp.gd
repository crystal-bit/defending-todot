extends Control

@onready var label := $PanelContainer/Label
const MAX_HP = 100


func set_hp(value: int):
	label.text = str(value)
	Game.start_hp = value
	Game.hp = value


func reduce_by(value):
	var new_value = Game.hp - value
	if new_value <= 0:
		# make sure that the current level is in the "Level" group
		var level_node: Node = get_tree().get_nodes_in_group("Levels")[0]
		Game.change_scene_to_file("res://scenes/gameplay/game-over-layer/game-over-layer.tscn",
		{
			"current_level_scene_path": level_node.scene_file_path
		})
	label.text = str(clamp(new_value, 0, MAX_HP))
	Game.hp = new_value
