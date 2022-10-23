extends PopupPanel

@export var tower_name: String = "Bombard"
@export var tower_description: String = "Bombards ground enemies dealing area damage"
@export var attack_power: String = "8-15"
@export var attack_speed: String = "very low"

@onready var tower_name_label : Label = $MarginContainer/VBoxContainer/VBoxContainer/TowerName
@onready var tower_description_label : Label = $MarginContainer/VBoxContainer/VBoxContainer/TowerDescription
@onready var attack_power_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/AttackPowerContainer/Value
@onready var attack_speed_label : Label = $MarginContainer/VBoxContainer/HBoxContainer/AttackSpeedContainer/Value


func _ready() -> void:
	get_viewport().connect("size_changed",Callable(self,"_on_screen_resize"))
	set_tower_data(tower_name, tower_description, attack_power, attack_speed)


func set_tower_data(t_name, t_description, t_atk, t_spd):
	tower_name_label.text = str(t_name)
	tower_description_label.text = t_description
	attack_power_label.text = str(t_atk)
	attack_speed_label.text = str(t_spd)
#	await get_tree().idle_frame
	update_size()


func _on_screen_resize():
	update_size()


func update_size():
	pass
#	set_as_minsize()
#	minimum_size_changed()


func show_at_position(position : Vector2):
	show()
	reset_size()
	position = position
	popup()
