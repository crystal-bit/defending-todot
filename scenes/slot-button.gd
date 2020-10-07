tool
class_name Slot
extends Button


signal slot_activated(slot)

onready var decoration = $Decoration

export (Texture) var tower_icon : Texture = null setget _set_icon, _get_icon
export (String) var tower_name : String = "" setget _set_tower_name, _get_tower_name
export (int) var tower_cost : int = 0 setget _set_cost, _get_cost


func _on_SlotButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		emit_signal("slot_activated", self)
	decoration.visible = button_pressed


func _set_icon(texture : Texture) -> void:
	get_node("VBoxContainer/TowerIcon").texture = texture
	tower_icon = texture


func _get_icon() -> Texture:
	return get_node("VBoxContainer/TowerIcon").texture


func _set_cost(cost : int) -> void:
	get_node("VBoxContainer/TowerCost").text = str(cost)
	tower_cost = cost


func _get_cost() -> int:
	return int(get_node("VBoxContainer/TowerCost").text)


func _set_tower_name(name : String) -> void:
	get_node("VBoxContainer/TowerName").text = name
	tower_name = name


func _get_tower_name() -> String:
	return get_node("VBoxContainer/TowerName").text
