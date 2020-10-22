extends Node2D
class_name EnemyWave

signal spawn_enemy(enemy_resource)
signal last_enemy_spawned()


#const CLASS_NAME := "EnemyWave"

var groups := []

var group_counter := -1
var group_ongoing := false
var wave_ongoing := false
var elapsed_time := 0.0
var last_group_spawned := false

# The time between the spawn of one group of enemies and the next, in seconds.
# Default value is 2 second.
export var delay_in_sec : float = 2.0

# A text description of the wave
export var description : String = "Placeholder description"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Add every children enemy_group to groups
	for children in get_children():
		if children is EnemyGroup:
			groups.append(children)
			children.connect("last_enemy_spawned", self, "_on_EnemyGroup_last_enemy_spawned")
			children.connect("spawn_enemy", self, "_on_EnemyGroup_spawn_enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wave_ongoing && !group_ongoing:
		elapsed_time += delta
		if elapsed_time >= delay_in_sec:
			_spawn_group()
			elapsed_time = 0.0


func _on_EnemyGroup_last_enemy_spawned():
	group_ongoing = false
	if last_group_spawned:
		emit_signal("last_enemy_spawned")
	
	
func _on_EnemyGroup_spawn_enemy(enemy_resource):
	emit_signal("spawn_enemy", enemy_resource)
	
	
func start_wave():
	if groups.size() > 0:
		wave_ongoing = true
		_spawn_group()


func _spawn_group():
	group_counter += 1
	group_ongoing = true
	if (group_counter + 1) >= groups.size():
		last_group_spawned = true
		wave_ongoing = false
		
	groups[group_counter].start_spawning()
	


#func is_class(type):
#	return type == CLASS_NAME || .is_class(type)


