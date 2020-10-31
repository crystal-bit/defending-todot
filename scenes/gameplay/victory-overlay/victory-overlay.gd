extends CanvasLayer


func appear():
	$ColorRect.mouse_filter = Control.MOUSE_FILTER_STOP
	$AnimationPlayer.play("appear")
	Game.set_current_level_as_done()


func _on_Button_pressed() -> void:
	Game.change_scene("res://scenes/gameplay/map/map.tscn")
