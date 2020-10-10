tool
class_name Slot
extends Button

onready var decoration = $Decoration

export (Texture) var tower_icon
export (TowerType.Type) var tower_name
export (int) var tower_cost

var tower_resource: Tower_Resource

const base_level : int = 1

signal slot_activated(is_already_active, slot)

func _ready() -> void:
	tower_resource = TowerManager.towers_by_level[base_level][tower_name]
	_set_icon(tower_resource.texture)
	_set_cost(tower_resource.cost)
	_set_tower_name(tower_resource.tower_type)


func _on_SlotButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		emit_signal("slot_activated", decoration.visible, self)
	decoration.visible = button_pressed


func _set_icon(texture : Texture) -> void:
	get_node("VBoxContainer/TowerIcon").texture = texture
	tower_icon = texture


func _set_cost(cost : int) -> void:
	get_node("VBoxContainer/TowerCost").text = str(cost)
	tower_cost = cost


func _get_cost() -> int:
	return int(get_node("VBoxContainer/TowerCost").text)


func _set_tower_name(name) -> void:
	var _tower_name = TowerType.Type.keys()[name].capitalize()
	get_node("VBoxContainer/TowerName").text = _tower_name


func _get_tower_name() -> String:
	return get_node("VBoxContainer/TowerName").text
