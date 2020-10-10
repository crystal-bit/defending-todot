extends Node2D

onready var map_container = $Map
var scale_map := Vector2.ZERO

func _ready() -> void:
	get_tree().connect("screen_resized", self, "_on_screen_resized")
	
func _on_screen_resized():
	scale_map.x = Game.size.x / map_container.texture.get_size().x
	scale_map.y = Game.size.y / map_container.texture.get_size().y
	map_container.set_position(Vector2(Game.size.x/2, Game.size.y/2))
	map_container.set_scale(Vector2(scale_map.x, scale_map.y))
	
	
