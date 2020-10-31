extends Control
class_name Money

onready var label = $PanelContainer/Label
var balance: int = 0 setget set_money, get_money

func set_money(value: int):
	balance = value if value > 0 else 0
	label.text = str(value)

func get_money() -> int:
	return balance

func add(amount: int):
	set_money(balance + amount)

func subtract(amount: int):
	set_money(balance - amount)
