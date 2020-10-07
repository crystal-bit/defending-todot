extends Button

signal slot_pressed

onready var decoration = $Decoration

export (Texture) var tower_icon
export (TowerType.Type) var tower_name
export (int) var tower_cost

const base_level : int = 1

func _ready() -> void:
	var tower_resource : Tower_Resource = TowerManager.towers_by_level[base_level][tower_name]
	_set_icon(tower_resource.sprite)
	_set_cost(tower_resource.cost)
	_set_tower_name(tower_resource.tower_type)
	

func _on_SlotButton_pressed() -> void:
	emit_signal("slot_pressed", tower_name, tower_cost)
	decoration.visible = false


func _set_icon(texture : Texture) -> void:
	get_node("VBoxContainer/TowerIcon").texture = texture
	if Engine.is_editor_hint():
		tower_icon = texture


func _set_cost(cost : int) -> void:
	get_node("VBoxContainer/TowerCost").text = str(cost)
	if Engine.is_editor_hint():
		tower_cost = cost


func _set_tower_name(name) -> void:
	var _tower_name = TowerType.Type.keys()[name].capitalize()
	get_node("VBoxContainer/TowerName").text = _tower_name
