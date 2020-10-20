extends Area2D

const Utils = preload("res://scenes/commons/utils.gd")

onready var strategic_point_menu = $StrategicPointMenu
onready var tower_description_popup = get_node("../../CanvasLayer/TowerDescriptionPopup")

onready var tower_container = $TowerContainer
onready var tower_scene = preload("res://scenes/tower/tower.tscn")
onready var sprite = $Sprite

var mouse_inside_area = false
var last_slot_pressed = null

func _ready() -> void:
	for slot in strategic_point_menu.get_slots():
		if not slot is Sprite and not slot.tower_resource.locked:
			slot.connect("pressed", self, "_on_slot_pressed", [slot])


func _on_StrategicPoint_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var tower: Tower = get_tower()
	if tower and tower.state == tower.TOWER_STATES.GAMEPLAY:
		# currently we don't show anything if there is a tower placed.
		# This may change in the future to allow tower upgrades
		return

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if strategic_point_menu.visible:
					hide_strategic_point_menu()
				else:
					strategic_point_menu.show_menu()


func hide_strategic_point_menu():
	strategic_point_menu.hide_menu()
	var tower: Tower = get_tower()
	if tower and tower.state == tower.TOWER_STATES.PREVIEW:
		Utils.delete_children_from_node(tower_container)
		sprite.show()
	last_slot_pressed = null


func _on_slot_pressed(slot: Slot):
	if slot != last_slot_pressed:
		show_tower_description_popup(slot)
		last_slot_pressed = slot
		place_tower(slot.tower_resource) # preview tower


func show_tower_description_popup(slot: Slot):
	tower_description_popup.set_tower_data(
		slot.get_readable_name(),
		slot.tower_resource.description,
		slot.tower_resource.damage,
		slot.tower_resource.fire_rate
	)
	var description_appear_pos = slot.rect_global_position
	if slot.rect_position.x > 0:
		description_appear_pos.x += slot.rect_size.x
	else:
		description_appear_pos.x -= tower_description_popup.rect_size.x
	tower_description_popup.show_at_position(description_appear_pos)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if not mouse_inside_area:
			hide_strategic_point_menu()


func _on_StrategicPoint_mouse_entered() -> void:
	mouse_inside_area = true


func _on_StrategicPoint_mouse_exited() -> void:
	mouse_inside_area = false


func _on_StrategicPointMenu_tower_bought(tower_type) -> void:
	var tower: Tower = tower_container.get_child(0)
	tower.change_state(tower.TOWER_STATES.GAMEPLAY)
	tower_description_popup.hide()


func place_tower(tower_resource) -> void:
	Utils.delete_children_from_node(tower_container)
	var tower: Tower = tower_scene.instance()
	tower.initialise(tower_resource)
	tower.change_state(tower.TOWER_STATES.PREVIEW)
	tower_container.add_child(tower)
	sprite.hide()


func get_tower() -> Tower:
	if tower_container.get_child_count() == 0:
		return null
	return tower_container.get_child(0)
