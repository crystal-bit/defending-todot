extends Area2D

const Utils = preload("res://scenes/commons/utils.gd")

onready var tower_container = $TowerContainer
onready var tower_scene = preload("res://scenes/tower/tower.tscn")


func _on_StrategicPointMenu_tower_selected(tower_name) -> void:
	Utils.delete_children_from_node(tower_container)
	var tower : Tower = tower_scene.instance()
	tower.initialise(tower_name, 1)
	tower_container.add_child(tower)
	$Sprite.hide()


func _on_StrategicPoint_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if $StrategicPointMenu.visible:
					$StrategicPointMenu.hide()
				else:
					$StrategicPointMenu.show()
