extends Control

onready var label = $PanelContainer/Label
onready var nomoney = $InsufficientMoney


func set_money(value: int):
	label.text = str(value)
	nomoney.popup()
	


