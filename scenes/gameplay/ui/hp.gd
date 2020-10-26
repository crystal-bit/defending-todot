extends Control

onready var label := $PanelContainer/Label
const MAX_HP = 100


func set_hp(value: int):
	label.text = str(value)


func reduce_by(value):
	var new_value = int(label.text) - value
	if new_value <= 0:
		print("TODO: game over")
	label.text = str(clamp(new_value, 0, MAX_HP))
