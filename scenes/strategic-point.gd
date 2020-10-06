extends Area2D

onready var strategic_point_menu = $StrategicPointMenu

var mouse_inside_area : bool = false


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(1):
		if mouse_inside_area:
			strategic_point_menu.visible = true
		else:
			strategic_point_menu.visible = false


func _on_StrategicPoint_mouse_entered() -> void:
	mouse_inside_area = true


func _on_StrategicPoint_mouse_exited() -> void:
	mouse_inside_area = false
