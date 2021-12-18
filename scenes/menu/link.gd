extends Label


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
#			if event.position
			var rect: Rect2 = Rect2(rect_global_position, rect_size)
			if rect.has_point(event.position):
				OS.shell_open("https://github.com/crystal-bit/defending-todot")
