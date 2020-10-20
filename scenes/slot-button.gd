class_name Slot
extends Button

onready var decoration = $Decoration
onready var initial_position: Vector2 = rect_position

export(Resource) var tower_resource
var tower_locked: Tower_Resource = preload("res://scenes/tower/tower_types/locked.tres")
const base_level : int = 1

signal slot_activated(is_already_active, slot)


func _ready() -> void:
	if !tower_resource:
		return
	if tower_resource.locked:
		disabled = true
	_set_icon(tower_resource.texture)
	_set_cost(tower_resource.cost)
	_set_tower_name(tower_resource.tower_type)


func get_readable_name():
	return tower_resource.get_readable_name()


func _on_SlotButton_toggled(button_pressed: bool) -> void:
	if button_pressed:
		emit_signal("slot_activated", decoration.visible, self)
	decoration.visible = button_pressed


func _set_icon(texture : Texture) -> void:
	get_node("VBoxContainer/TowerIcon").texture = texture


func _set_cost(cost : int) -> void:
	if cost == 0:
		get_node("VBoxContainer/TowerCost").text = ""
	else:
		get_node("VBoxContainer/TowerCost").text = str(cost)


func _get_cost() -> int:
	return int(get_node("VBoxContainer/TowerCost").text)


func _set_tower_name(name) -> void:
	var _tower_name = TowerType.Type.keys()[name].capitalize()
	get_node("VBoxContainer/TowerName").text = _tower_name


func _get_tower_name() -> String:
	return get_node("VBoxContainer/TowerName").text
	
