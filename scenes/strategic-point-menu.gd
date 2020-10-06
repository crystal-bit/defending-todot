extends HBoxContainer

signal tower_selected(tower_name)

onready var slot_container = $SlotContainer


func _ready() -> void:
	var group : ButtonGroup = ButtonGroup.new()
	for slot in slot_container.get_children():
		slot.button_group = group


func _on_Slot_pressed(tower_name : String, tower_cost : int) -> void:
	if Game.user_money >= tower_cost: # This is a placeholder, I don't know how should I get the user money, as it isn't defined yet
		emit_signal("tower_selected", tower_name)
	#popup_panel.popup(tower_name) # Show the popup with tower name as parameter to load the proper informations

