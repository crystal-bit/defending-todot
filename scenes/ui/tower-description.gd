extends PopupPanel

export(String) var tower_name = "Bombard"
export(String) var tower_description = "Bombards ground enemies dealing area damage"
export(String) var attack_power = "8-15"
export(String) var attack_speed = "very low"

onready var tower_name_label : Label = $MarginContainer/VBoxContainer/VBoxContainer/TowerName
onready var tower_description_label : Label = $MarginContainer/VBoxContainer/VBoxContainer/TowerDescription
onready var attack_power_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/AttackPowerContainer/Value
onready var attack_speed_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/AttackSpeedContainer/Value


func _ready() -> void:
	yield(get_tree(),"idle_frame") #workaround for play scene
	tower_name_label.text = tower_name
	tower_description_label.text = tower_description
	attack_power_label.text = attack_power
	attack_speed_label.text = attack_speed
	
	
func show_at_position(position : Vector2):
	popup()
	set_as_minsize()
	rect_global_position = position
