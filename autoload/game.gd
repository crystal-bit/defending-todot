extends Node


var user_money : int = 10000

# Add num. elements by num. levels [num. stars];
# TODO: Load form save file
var n_stars_level = [2,0,0,0,0,0,0,0,0,0] # 10 Levels

var size := Vector2.ZERO


func _ready() -> void:
	TranslationServer.set_locale('en')
	get_tree().connect("screen_resized", self, "_on_screen_resized")
	register_size()


func _on_screen_resized():
	register_size()


func register_size():
	size = get_viewport().get_visible_rect().size


func set_main_node(node: Main):
	Scenes.main = node


func change_scene(new_scene, params= {}):
	Scenes._change_scene(new_scene, params)
