extends Node2D




# To call the waves use start_next_wave() method
func _on_Button_pressed():
	$RichTextLabel.text += "\n--- Enemies arrives: " + $WaveManager.get_next_wave_description()
	$RichTextLabel.text += " ---"
	$WaveManager.start_next_wave()
	$Button.disabled = true

# WaveManager say you when instantiate a new enemy (spawn at start point 
# and begin to following the path: say you the type and rank (grade).
func _on_WaveManager_spawn_enemy(enemy_resource: EnemyResource):
	var enemy_text = "Spawn "  + enemy_resource.get_name() + " " + str(enemy_resource.grade)
	$RichTextLabel.text += "\n"
	$RichTextLabel.text += enemy_text

# When the wave is finished: last enemy was been spawned. Remember that now 
# you can control if there are no more enemies alive for win wave or win level 
# conditions.
func _on_WaveManager_last_enemy_in_actual_wave_spawned():
	$RichTextLabel.text += "\n--- Wave completed: " + $WaveManager.get_actual_wave_description() + " ---"
	# In a real scenario you could verify that all enemies are died
	# before reactivate the Call Wave Button.
	$Button.disabled = false

# Like above... but now is the last enemy of the last wave for this level. 
func _on_WaveManager_last_enemy_spawned():
	$RichTextLabel.text += "\n**********************************************"
	$RichTextLabel.text += "\nNo more waves of enemy."
	$RichTextLabel.text += "\nThe game is end after you kill the last enemy!"
	$RichTextLabel.text += "\n**********************************************"
	$Button.disabled = true

# Wave Manager say you when Last Wave of the level is started.
func _on_WaveManager_last_wave():
	$RichTextLabel.text += "\n--- This is the last wave of the level! ---"


# -----------------------------
# Only for test purpose - begin
# -----------------------------
func get_enemy_name(type) -> String:
	match type:
		EnemyTypes.ENEMY_TYPES.SOLDIER:
			return "Soldier"
		EnemyTypes.ENEMY_TYPES.COMMANDO:
			return "Commando"
		EnemyTypes.ENEMY_TYPES.ARMORED_TRANSPORT:
			return "Armored Transport"
		EnemyTypes.ENEMY_TYPES.TANK:
			return "Tank"
		EnemyTypes.ENEMY_TYPES.AIRCRAFT:
			return "Aircraft"
		_:
			return "Unknown"
			
func get_enemy_rank(grade) -> String:
	match grade:
		EnemyTypes.GRADE.NORMAL:
			return "Normal"
		EnemyTypes.GRADE.ELITE:
			return "Elite"
		_:
			return "Unknown"
# ---------------------------
# Only for test purpose - end
# ---------------------------


