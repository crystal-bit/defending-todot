extends Control

signal tower_selected(tower_name)


func _ready() -> void:
	for node in get_children():
		node.connect("slot_activated", self, "_on_Slot_pressed")


func _on_Slot_pressed(slot: Slot) -> void:
	if Game.user_money >= slot.tower_cost: # This is a placeholder, I don't know how should I get the user money, as it isn't defined yet
		emit_signal("tower_selected", slot.tower_name)
	else:
		print("Not enough money")
	#popup_panel.popup(tower_name) # Show the popup with tower name as parameter to load the proper informations
