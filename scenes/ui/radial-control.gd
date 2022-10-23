extends Control

@export var radius = 300
@export var animation_speed = 0.25

@onready var strategic_point_menu = get_node("..")
var tween: Tween


func show_radial_menu():
	visible = true
	var slots = get_slots()
	var angle_offset = (2 * PI) / slots.size()

	var angle = -PI / 2

	for slot in slots:
		var radial_position = Vector2(radius, 0).rotated(angle)
		tween = create_tween()
		tween.tween_property(slot, "position",
			radial_position - slot.size / 2, animation_speed)
		tween.tween_property(slot, "scale", Vector2.ONE, animation_speed)
		tween.tween_property(slot, "modulate", Color(1, 1, 1, 1), animation_speed)
		angle += angle_offset


func hide_radial_menu():
	visible = false
	if tween and tween.is_valid() and tween.is_running():
		tween.kill()
	var slots = strategic_point_menu.get_slots()
	for slot in slots:
		slot.position = slot.initial_position


func get_slots() -> Array:
	var slots = []
	for child in get_children():
		if child is Slot and child.visible:
			slots.append(child)
	return slots
