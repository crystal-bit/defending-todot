extends Node2D

onready var level = $Level
onready var ui = $UI
const level_path = "res://scenes/gameplay/levels/level%d.tscn"


func _ready() -> void:
	pass


func _on_HitArea_enemy_arrived(enemy):
	# TODO: add "hp damage" property to enemy resource
	ui.hp.reduce_by(1)


func pre_start(params):
	if not params.has("level_idx"):
		load_level(1)
	else:
		load_level(params.level_idx)


func start():
	for ha in get_tree().get_nodes_in_group("HitAreas"):
		var hit_area: HitArea = ha
		hit_area.connect("enemy_arrived", self, "_on_HitArea_enemy_arrived")



func load_level(level_idx):
	level.replace_by_instance(load(level_path % level_idx))
	update_ui()


func update_ui():
	Game.money = 600
	var wave_manager: WaveManager = get_tree().get_nodes_in_group("WaveManager")[0]
	ui.wave.set_wave(0, wave_manager.waves.size())
	ui.hp.set_hp(20)
	ui.money.set_money(Game.money)
	wave_manager.connect("wave_started", self, "_on_wave_manager_wave_started")


func _on_wave_manager_wave_started(wave_id):
	ui.wave.set_wave(wave_id + 1)
