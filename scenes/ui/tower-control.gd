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

	var sell_resource : Tower_Resource = _get_sell_resource(tower_resource)
	
	slots[1].tower_resource = sell_resource
	slots[1]._ready()
	
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

func _get_sell_resource(tower_resource : Tower_Resource) -> Tower_Resource:
	var sell_resource : Tower_Resource = load("res://scenes/tower/tower_types/sell_tower.tres")
	if tower_resource.level > 1:
		var base_level_tower : Tower_Resource = load("res://scenes/tower/tower_types/" + tower_resource.get_readable_name().to_lower() + "_1.tres")
		sell_resource.cost = floor(tower_resource.cost / 2) + floor(base_level_tower.cost / 2)
		return sell_resource
		
	sell_resource.cost = floor(tower_resource.cost / 2)
	return sell_resource

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
