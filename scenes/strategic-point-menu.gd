extends Control

signal tower_selected(tower_name)

onready var slot_container = $SlotContainer

func _ready() -> void:
	for node in get_children():
		node.connect("slot_pressed", self, "_on_Slot_pressed")


func _on_Slot_pressed(tower_name, tower_cost) -> void:
	if Game.user_money >= tower_cost: # This is a placeholder, I don't know how should I get the user money, as it isn't defined yet
		emit_signal("tower_selected", tower_name)
		hide()
	#popup_panel.popup(tower_name) # Show the popup with tower name as parameter to load the proper informations
