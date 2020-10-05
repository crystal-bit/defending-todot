tool
extends Button

signal slot_pressed(tower_name, tower_cost)

onready var decoration = $Decoration

export (Texture) var tower_icon : Texture = null setget _set_icon, _get_icon
export (String) var tower_name : String = "" setget _set_tower_name, _get_tower_name
export (int) var tower_cost : int = 0 setget _set_cost, _get_cost
#export (ButtonGroup) var button_group : ButtonGroup = null setget _set_btn_group, _get_btn_group


func _on_SlotButton_toggled(button_pressed: bool) -> void:
	emit_signal("slot_pressed", tower_name, tower_cost)
	decoration.visible = button_pressed


func _set_icon(texture : Texture) -> void:
	get_node("VBoxContainer/TowerIcon").texture = texture
	if Engine.is_editor_hint():
		tower_icon = texture


func _get_icon() -> Texture:
	return get_node("VBoxContainer/TowerIcon").texture


func _set_cost(cost : int) -> void:
	get_node("VBoxContainer/TowerCost").text = str(cost)
	if Engine.is_editor_hint():
		tower_cost = cost


func _get_cost() -> int:
	return int(get_node("VBoxContainer/TowerCost").text)


func _set_tower_name(name : String) -> void:
	get_node("VBoxContainer/TowerName").text = name
	if Engine.is_editor_hint():
		tower_name = name


func _get_tower_name() -> String:
	return get_node("VBoxContainer/TowerName").text


#func _set_btn_group(btn_group : ButtonGroup) -> void:
#	get_node("Button").group = btn_group
#	if Engine.is_editor_hint():
#		button_group = btn_group
#
#
#func _get_btn_group() -> ButtonGroup:
#	return get_node("Button").group

