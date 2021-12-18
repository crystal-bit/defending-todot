extends Node

var checkpoint = preload("res://scenes/gameplay/map/checkpoint.gd")

var money = 0
var start_hp = 0
var hp = 0
var levels = [
	{
		"state": checkpoint.CHECKPOINT_STATE.TODO,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	},
	{
		"state": checkpoint.CHECKPOINT_STATE.LOCKED,
		"star_rating": -1
	}
]
var current_level = -1

var size := Vector2.ZERO


func _ready() -> void:
	# TranslationServer.set_locale('es')
	get_tree().connect("screen_resized", self, "_on_screen_resized")
	register_size()


func _on_screen_resized():
	register_size()


func register_size():
	size = get_viewport().get_visible_rect().size


func set_main_node(node: Main):
	Scenes.main = node


func change_scene(new_scene, params = {}):
	Scenes._change_scene(new_scene, params)


func set_current_level_as_done():
	var cur_level = Game.levels[Game.current_level - 1]
	cur_level.state = checkpoint.CHECKPOINT_STATE.DONE
	if Game.hp >= Game.start_hp: #if the user didn't lose hp
		cur_level.star_rating = 3
	elif Game.hp < Game.start_hp && hp >= Game.start_hp / 2: #if the user lost less than half of the initial hp
		cur_level.star_rating = 2
	elif Game.hp < Game.start_hp / 2: #if the user lost more than half of the initial hp
		cur_level.star_rating = 1
	if (Game.current_level + 1) <= len(Game.levels) && Game.levels[Game.current_level].state == checkpoint.CHECKPOINT_STATE.LOCKED:
		var next_level = Game.levels[Game.current_level]
		next_level.state = checkpoint.CHECKPOINT_STATE.TODO

