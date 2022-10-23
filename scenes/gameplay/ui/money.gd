extends Control
class_name Money

@onready var label = $PanelContainer/Label
var balance: int = 0 :
	get:
		return balance # TODOConverter40 Copy here content of get_money
	set(mod_value):
		mod_value  # TODOConverter40 Copy here content of set_money

func set_money(value: int):
	balance = value if value > 0 else 0
	label.text = str(value)

func get_money() -> int:
	return balance

func add(amount: int):
	set_money(balance + amount)

func subtract(amount: int):
	set_money(balance - amount)
