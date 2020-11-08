extends Node2D

const ENEMY_FOLLOWING_H_OFFSET = 15
const ENEMY_FOLLOWING_V_OFFSET = 50

onready var wave_manager: WaveManager = $WaveManager
var enemy_scene = preload("res://scenes/enemy/enemy.tscn")

signal level_ended


func _on_WaveManager_spawn_enemy(enemy_resource):
	var enemy: Enemy = enemy_scene.instance()
	enemy.initialise(enemy_resource)
	var path_foll = PathFollow2D.new()
	path_foll.loop = false
	path_foll.position = $SpawnPoint.position
	path_foll.h_offset = rand_range(0.0, ENEMY_FOLLOWING_H_OFFSET)
	path_foll.v_offset = rand_range(0.0, ENEMY_FOLLOWING_V_OFFSET)
	path_foll.add_child(enemy)
	$Path2D.add_child(path_foll)
	enemy.connect("arrived_to_hitarea", self, "_on_enemy_arrived_to_hit_area")
	enemy.connect("death", self, "_on_enemy_death")


func _on_enemy_arrived_to_hit_area(enemy):
	wave_manager.total_enemies_count -= 1
	check_if_last_enemy()


func _on_enemy_death(money: int, enemy_position: Vector2):
	var balance: Money = get_tree().get_nodes_in_group("UI")[0].money
	balance.add(money)
	$Particles2D.position = enemy_position
	$Particles2D.amount = max(1, (money / 10))
	$Particles2D.emitting = true
	wave_manager.total_enemies_count -= 1
	check_if_last_enemy()


func check_if_last_enemy():
	#print(wave_manager.total_enemies_count)
	if wave_manager.total_enemies_count == 0:
		emit_signal("level_ended")


func _on_WaveManager_last_enemy_in_actual_wave_spawned():
	pass


func _on_WaveManager_last_enemy_spawned():
	pass


func _on_WaveManager_last_wave():
	pass # Replace with function body.
