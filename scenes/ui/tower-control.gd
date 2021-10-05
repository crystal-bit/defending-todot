extends Control

export var radius = 300
export var animation_speed = 0.25

onready var strategic_point_menu = get_node("..")
onready var tween = $Tween

func show_tower_menu(tower_resource):
	visible = true
	var slots = get_slots()
	if tower_resource.level < 2:
		slots[0].tower_resource = load("res://scenes/tower/tower_types/" + tower_resource.get_readable_name().to_lower() + "_2.tres")
		slots[0]._ready()
	else:
		slots[0].visible = false
	
	var angle_offset = (2 * PI) / slots.size()
	
	var angle = -PI / 2
	
	for slot in slots:
		var radial_position = Vector2(radius, 0).rotated(angle)
		
		tween.interpolate_property(slot, "rect_position",
				slot.rect_position, radial_position - slot.rect_size / 2, animation_speed,
				Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.interpolate_property(slot, "rect_scale",
				Vector2(0.5, 0.5), Vector2.ONE, animation_speed,
				Tween.TRANS_LINEAR)
		tween.interpolate_property(slot, "modulate",
				slot.modulate, Color(1, 1, 1, 1), animation_speed,
				Tween.TRANS_BACK, Tween.EASE_OUT)
		angle += angle_offset
		
	tween.start()

func hide_tower_menu():
	visible = false
	tween.stop_all()
	var slots = strategic_point_menu.get_slots()
	
	for slot in slots:
		slot.rect_position = slot.initial_position

func get_slots() -> Array:
	var slots = []
	for child in get_children():
		if child is Slot:
			slots.append(child)
	return slots
