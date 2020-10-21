extends Control

signal tower_selected(tower_name)
signal tower_bought(tower)


onready var radial_control = $RadialControl


func _ready() -> void:
	for node in get_slots():
		node.connect("slot_activated", self, "_on_Slot_pressed")


func _on_Slot_pressed(is_slot_active, slot: Slot):
	if is_slot_active:
		buy_tower(slot)


func get_slots() -> Array:
	var slots = []
	for child in radial_control.get_children():
		if child is Slot and child.visible:
			slots.append(child)

	return slots


func reset_slots():
	for slot in get_slots():
		slot.pressed = false


func show_menu():
	show()
	radial_control.show_radial_menu()


func hide_menu():
	hide()
	radial_control.hide_radial_menu()
	reset_slots()

func buy_tower(slot: Slot):
	if Game.user_money >= slot.tower_resource.cost:
		emit_signal("tower_bought", slot.tower_resource.tower_type)
		hide()
	else:
		print("Not enough money")


func show():
	visible = true


func hide():
	visible = false
	for slot in get_children():
		if slot is Slot:
			slot.decoration.visible = false
			slot.pressed = false

