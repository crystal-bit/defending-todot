extends Node

const FILE_NAME := "user://game.save"

var is_first_boot = true

class DefendingTodotSave:
	var last_save_time: int
	func to_dict():
		return {
			last_save_time = last_save_time,
		}


func _init():
	if not FileAccess.file_exists(FILE_NAME):
		var file = FileAccess.open(FILE_NAME, FileAccess.READ)
		var save := DefendingTodotSave.new()
		save.last_save_time = Time.get_unix_time_from_system()
		save_data(save.to_dict())
	# No need for close(), `file` is reference counted and will be closed when going out of scope.
	else: 
		is_first_boot = false


func load_data():
	if not FileAccess.file_exists(FILE_NAME):
		print("No file save found")
		return null # Error! We don't have a save to load.
	# Get the saved dictionary from the next line in the save file
	var save_game = FileAccess.open(FILE_NAME, FileAccess.READ)
	var data = save_game.get_line()
	var test_json_conv = JSON.new()
	test_json_conv.parse(data)
	return test_json_conv.get_data()


func save_data(data):
	var save_game = FileAccess.open(FILE_NAME, FileAccess.WRITE)
	# Store the save dictionary as a new line in the save file.
	save_game.store_line(JSON.new().stringify(data))
