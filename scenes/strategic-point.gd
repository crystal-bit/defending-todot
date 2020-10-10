extends Area2D

const Utils = preload("res://scenes/commons/utils.gd")

onready var strategic_point_menu = $StrategicPointMenu
onready var tower_description_popup = get_node("../../TowerDescriptionPopup")

onready var tower_container = $TowerContainer
onready var tower_scene = preload("res://scenes/tower/tower.tscn")

var mouse_inside_area = false


func _ready() -> void:
	for slot in $StrategicPointMenu.get_children():
		slot.connect("pressed", self, "_on_slot_pressed", [slot])


func _on_StrategicPoint_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if $StrategicPointMenu.visible:
					$StrategicPointMenu.hide()
				else:
					$StrategicPointMenu.show()


func _on_slot_pressed(slot: Slot):
	tower_description_popup.set_tower_data(
		slot.tower_name,
		"Missing description", # TODO: add tower description https://github.com/crystal-bit/hacktoberfest-2020/issues/33
		slot.tower_resource.damage,
		slot.tower_resource.fire_rate
	)
	var description_appear_pos = slot.rect_global_position
	if slot.rect_position.x > 0:
		description_appear_pos.x += slot.rect_size.x
	else:
		description_appear_pos.x -= tower_description_popup.rect_size.x
	tower_description_popup.show_at_position(description_appear_pos)
	place_tower(slot.tower_name)
	

func place_tower(tower_name) -> void:
	Utils.delete_children_from_node(tower_container)
	var tower: Tower = tower_scene.instance()
	tower.initialise(tower_name, 1)
	tower_container.add_child(tower)
	$Sprite.hide()
	
	
func _unhandled_input(event: InputEvent) -> void:
	# if event is InputEventMouseButton:
	if event.is_action_pressed("ui_accept"):
		if mouse_inside_area:
			strategic_point_menu.visible = true
		else:
			strategic_point_menu.visible = false


func _on_StrategicPoint_mouse_entered() -> void:
	mouse_inside_area = true


func _on_StrategicPoint_mouse_exited() -> void:
	mouse_inside_area = false
