extends PopupPanel


var timer = 0 # s


func register_signals():
	var strategic_point_menus = get_tree().get_nodes_in_group("StrategicPointMenus")
	for spm in strategic_point_menus:
		spm.connect("no_money", self, "_on_StrategicPointMenu_no_money")


func _on_StrategicPointMenu_no_money():
	popup()
	timer = 2
	set_process(true)


func _process(delta: float) -> void:
	if timer <= 0:
		hide()
		set_process(false)
	else:
		timer -= delta
