extends Control

var waves_count: int = 0
var current_wave: int = 0


func set_wave(p_current_wave, p_waves_count = null):
	current_wave = p_current_wave
	waves_count = p_waves_count if p_waves_count else waves_count
	assert(current_wave <= waves_count and current_wave >= 0)

	var label = get_node("PanelContainer/Label")
	label.text = "%s / %s" % [current_wave, waves_count]
