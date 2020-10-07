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
	get_tree().connect("screen_resized", self, "_on_screen_resize")
	set_tower_data(tower_name, tower_description, attack_power, attack_speed)


func set_tower_data(t_name, t_description, t_atk, t_spd):
	tower_name_label.text = t_name
	tower_description_label.text = t_description
	attack_power_label.text = t_atk
	attack_speed_label.text = t_spd
	yield(get_tree(), "idle_frame")
	update_size()


func _on_screen_resize():
	update_size()


func update_size():
	set_as_minsize()
	minimum_size_changed()


func show_at_position(position : Vector2):
	rect_global_position = position
	popup()
