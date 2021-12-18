extends Node

const FILE_NAME := "user://game.save"

var is_first_boot = true

class DefendingTodotSave:
	var last_save_time: int
	func to_dict():
		return {
			last_save_time = last_save_time,
		}

func _init() -> void:
	var save_game = File.new()
	save_game.open(FILE_NAME, File.READ)
	if not save_game.file_exists(FILE_NAME):
		var save := DefendingTodotSave.new()
		save.last_save_time = OS.get_unix_time()
		save_data(save.to_dict())
	else:
		is_first_boot = false

func load_data():
	var save_game = File.new()
	save_game.open(FILE_NAME, File.READ)
	if not save_game.file_exists(FILE_NAME):
		print("No file save found")
		return null # Error! We don't have a save to load.
	# Get the saved dictionary from the next line in the save file
	var data = save_game.get_line()
	save_game.close()
	return parse_json(data)

func save_data(data):
	var save_game = File.new()
	save_game.open(FILE_NAME, File.WRITE)
	# Store the save dictionary as a new line in the save file.
	save_game.store_line(to_json(data))
	save_game.close()
