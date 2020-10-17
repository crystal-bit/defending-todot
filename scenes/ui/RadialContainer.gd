extends Container
tool

export var radius = 300

func _process(delta: float) -> void:
	var buttons = get_children()
	var buttons_visible = []
	
	for btn in buttons:
		if btn.visible:
			buttons_visible.append(btn)
	
	var angle_offset = (2 * PI) / buttons_visible.size()
	
	var angle = -PI/2
	for btn in buttons_visible:
		var radial_position = Vector2(radius, 0).rotated(angle)

		btn.rect_position = radial_position - btn.rect_size / 2

		angle += angle_offset
