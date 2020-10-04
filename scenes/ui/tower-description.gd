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
	tower_name_label.text = self.tower_name
	tower_description_label.text = self.tower_description
	attack_power_label.text = self.attack_power
	attack_speed_label.text = self.attack_speed
	
	
func show_at_position(position : Vector2):
		self.set_anchors_and_margins_preset(Control.PRESET_CENTER, Control.PRESET_MODE_MINSIZE)
		self.rect_global_position = position
		self.popup()
