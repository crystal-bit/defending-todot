extends Node2D
# To manage enemy waves gameplay and enemy spawn managment: 
# use to start enemy waves in the game level,
# to know when to spawn an enemy (and enemy type to spawn),
# to manage level win condition, next wave ready condition, ecc...

# Emitted when last wave in the wave list is spawned.
signal last_wave()

# Emitted when the last enemy of the last wave in the wave list is spawned.
# There are no more enemies to spawn after this (for this level).
signal last_enemy_spawned()

# Emitted when the last enemy of the actual wave is spawned: this means that
# the actual wave is completed spawned (there are no enemy in queue for
# this wave).
signal last_enemy_in_actual_wave_spawned()

# Emitted when an enemy from a wave need to be spawn.
signal spawn_enemy(enemy_resource)

var waves := []
var wave_counter := -1
var is_last_wave := false


# Called when the node enters the scene tree for the first time.
func _ready():
	# Add every children enemy_wave to waves
	for children in get_children():
		#if children.is_class(EnemyWave.CLASS_NAME):
		if children is EnemyWave:
			waves.append(children)
			children.connect("last_enemy_spawned", self, "_on_EnemyWave_last_enemy_spawned")
			children.connect("spawn_enemy", self, "_on_EnemyWave_spawn_enemy")


func _on_EnemyWave_last_enemy_spawned():
	emit_signal("last_enemy_in_actual_wave_spawned")
	if is_last_wave:
		emit_signal("last_enemy_spawned")
		
	
func _on_EnemyWave_spawn_enemy(enemy_resource):
	emit_signal("spawn_enemy", enemy_resource)


# As start next wave (see below) but for signal
func _on_start_next_wave():
	start_next_wave()
	
	
# Start next wave in list.
# Return true if the wave is started.
# Return false if there are no more waves to start.
func start_next_wave() -> bool:
	var started := false
	wave_counter += 1
	if wave_counter <  waves.size():
		started = true
		
		if (wave_counter + 1) >= waves.size():
			is_last_wave = true
			emit_signal("last_wave")
			
		waves[wave_counter].start_wave()
			
	return started


# Actual wave is ongoing or was done with the next not yet started
func get_actual_wave_description() -> String:
	if wave_counter < waves.size() && wave_counter > -1:
		return waves[wave_counter].description
	else:
		# This is an invalid situation
		return "No wave"


# Next wave... not yet started
func get_next_wave_description() -> String:
	if (wave_counter + 1) < waves.size():
		return waves[wave_counter + 1].description
	else:
		# This is an invalid situation
		return "No wave"
		
		
# To know if there is a wave ready to go
func does_next_wave_exists() -> bool:
	return (wave_counter + 1) < waves.size()
