extends CanvasLayer


func appear():
	$ColorRect.mouse_filter = Control.MOUSE_FILTER_STOP
	$AnimationPlayer.play("appear")
	Game.set_current_level_as_done()


func _on_Button_pressed() -> void:
	Game.change_scene_to_file("res://scenes/gameplay/map/map.tscn")


func activate_button():
	$ColorRect/Button.disabled = false
