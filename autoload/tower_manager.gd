extends Node

const Util = preload("res://scenes/commons/utils.gd")

var _load_path : String = "res://scenes/tower/tower_types/"

var towers_by_level := {}
var _towers := []


func _init() -> void:
	_towers = Util.load_resources_from_directory(_load_path)
	towers_by_level = _sort_by_level()


func _sort_by_level() -> Dictionary:
	var result := {}
	for tower in _towers:
		if result.has(tower.level):  
			result[tower.level].append(tower)
		else:
			result[tower.level] = [tower]
	return result
