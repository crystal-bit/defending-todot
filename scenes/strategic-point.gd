extends Area2D

onready var strategic_point_menu = $StrategicPointMenu
onready var tower_description_popup = get_parent().get_node("TowerDescriptionPopup")

var mouse_inside_area : bool = false


func _ready() -> void:
	for slot in $StrategicPointMenu.get_children():
		slot.connect("slot_activated", self, "_on_slot_activated")
		

func _on_slot_activated(slot: Slot):
	tower_description_popup.set_tower_data(
		slot.tower_name, 
		"inventarmi una descrizione tanto per provare se sta roba funziona",
		"300",
		"20"
	)
	var description_appear_pos = slot.rect_global_position
	if slot.rect_position.x > 0:
		description_appear_pos.x += slot.rect_size.x
	else:
		description_appear_pos.x -= tower_description_popup.rect_size.x
	tower_description_popup.show_at_position(description_appear_pos)
	

func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
	if event.is_action_pressed("ui_accept"):
		if mouse_inside_area:
			strategic_point_menu.visible = true
		else:
			strategic_point_menu.visible = false


func _on_StrategicPoint_mouse_entered() -> void:
	mouse_inside_area = true


func _on_StrategicPoint_mouse_exited() -> void:
	mouse_inside_area = false
