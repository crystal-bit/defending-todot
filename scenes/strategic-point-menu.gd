extends Control

# warning-ignore:unused_signal
signal tower_selected(tower_name)
signal tower_bought(tower)
signal no_money()


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
	var money: Money = get_tree().get_nodes_in_group("UI")[0].money
	if money.balance >= slot.tower_resource.cost:
		money.subtract(slot.tower_resource.cost)
		emit_signal("tower_bought", slot.tower_resource.tower_type)
		hide()
	else:
		emit_signal("no_money")


func show():
	visible = true


func hide():
	visible = false
	for slot in get_children():
		if slot is Slot:
			slot.decoration.visible = false
			slot.pressed = false
