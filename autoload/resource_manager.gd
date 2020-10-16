extends Node
tool
const Util = preload("res://scenes/commons/utils.gd")

var _load_path: String = "res://scenes/tower/tower_types/"
var _enemies_path: String = "res://scenes/enemy/enemy-types/"

var towers_by_level := {}
var enemies_by_type = {}
var _towers := []
var _enemies := []


func _init() -> void:
	_towers = Util.load_resources_from_directory(_load_path)
	_enemies = Util.load_resources_from_directory(_enemies_path)
	towers_by_level = _sort_by_level()
	enemies_by_type = _aggregate_enemies_by_type()


func _aggregate_enemies_by_type():
	var obj = {}
	for e in _enemies:
		if obj.has(e.type):
			obj[e.type].append(e)
		else:
			obj[e.type] = [e]
	return obj


func _sort_by_level() -> Dictionary:
	var result := {}
	for tower in _towers:
		if result.has(tower.level):  
			result[tower.level].append(tower)
		else:
			result[tower.level] = [tower]
	return result
