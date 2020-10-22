extends Node2D
class_name EnemyGroup
# A group of enemies consists of one or more units of the same type and grade.

signal spawn_enemy(enemy_type, enemy_grade)
signal last_enemy_spawned()

#const CLASS_NAME := "EnemyGroup"

export(EnemyTypes.ENEMY_TYPES) var enemy_type
export(EnemyTypes.GRADE) var enemy_grade
export var num_of_enemies : int = 1

# The time between the spawn of one enemy and the next, in seconds.
# Default value is 1 second.
export var delay_in_sec : float = 1.0

var ongoing := false
var elapsed_time := 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
		emit_signal("spawn_enemy", enemy_type, enemy_grade)
		num_of_enemies -= 1
		if num_of_enemies <= 0:
			emit_signal("last_enemy_spawned")
			ongoing = false
	else:
		ongoing = false
		
		
#func is_class(type):
#	return type == CLASS_NAME || .is_class(type)


