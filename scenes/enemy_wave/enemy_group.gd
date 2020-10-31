extends Node2D
class_name EnemyGroup
# A group of enemies consists of one or more units of the same type and grade.

signal spawn_enemy(enemy_resource)
signal last_enemy_spawned()

export(Resource) var enemy_resource
export var num_of_enemies : int = 1

# The time between the spawn of one enemy and the next, in seconds.
export var delay_in_sec : float = 1.0

var ongoing := false
var elapsed_time := 0.0


func _ready() -> void:
	assert(enemy_resource, "Enemy resource is not configured")


func _process(delta):
	if ongoing:
		elapsed_time += delta
		if elapsed_time >= delay_in_sec:
			_spawn()
			elapsed_time = 0.0


func start_spawning():
	_spawn()
	

func _spawn():
	if num_of_enemies > 0:
		ongoing = true
		emit_signal("spawn_enemy", enemy_resource)
		num_of_enemies -= 1
		if num_of_enemies <= 0:
			emit_signal("last_enemy_spawned")
			ongoing = false
	else:
		ongoing = false
