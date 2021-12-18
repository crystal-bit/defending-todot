extends Control

signal confirm_button_pressed


func _on_Confirm_pressed():
	emit_signal("confirm_button_pressed")

