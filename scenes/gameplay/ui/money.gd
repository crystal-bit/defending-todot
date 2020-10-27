extends Control

onready var label = $PanelContainer/Label


func set_money(value: int):
	label.text = str(value)
