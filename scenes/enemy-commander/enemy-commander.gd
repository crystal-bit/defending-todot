extends Node2D

@export var wave_manager_path: NodePath
var wave_manager: WaveManager
@export var call_button_path: NodePath
var call_button

@export var wave_sequence: Array = [
#	[time from prev. wave end to to next call button visible, time to wave spawn],
	[2, 15],
	[15, 30],
]


func _ready():
	wave_manager = get_node(wave_manager_path)
	wave_manager.connect("last_enemy_in_actual_wave_spawned",Callable(self,"_on_last_enemy_in_actual_wave_spawned"))
	call_button = get_node(call_button_path)
	call_button.connect("next_wave_requested",Callable(self,"_on_next_wave_requested"))
#	await get_tree().idle_frame # for nodes to load
	wait_for_next_wave()


func wait_for_next_wave():
	if wave_manager.loading:
		await wave_manager.waves_loaded
	
	if wave_manager.wave_counter + 1 < wave_sequence.size() and wave_manager.does_next_wave_exists():
		await get_tree().create_timer(wave_sequence[wave_manager.wave_counter + 1][0]).timeout
		call_button.init_call_wave(wave_sequence[wave_manager.wave_counter + 1][1], wave_manager.get_next_wave_description())


func _on_last_enemy_in_actual_wave_spawned():
	wait_for_next_wave()


func _on_next_wave_requested(ecb: EnemyCallButton):
	wave_manager.start_next_wave()

