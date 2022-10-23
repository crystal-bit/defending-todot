class_name Main
extends Node

@onready var transitions: Transitions = $Transitions
@onready var active_scene_container = $ActiveSceneContainer

var initial_fade_active = true
var lock_input_until_scene_changed = false

func _init():
	Game.set_main_node(self)


func _ready():
	var active_scene: Node = get_active_scene()
	active_scene.set_process_input(false)
	active_scene.set_process_unhandled_input(false)

	if initial_fade_active:
		transitions.set_black()
		await get_tree().create_timer(0.3).timeout
		transitions.fade_out()


func get_active_scene():
	return active_scene_container.get_child(0)


func _input(event: InputEvent):
	if transitions.playing() or lock_input_until_scene_changed:
		# prevent  all input events
		get_viewport().set_input_as_handled()
