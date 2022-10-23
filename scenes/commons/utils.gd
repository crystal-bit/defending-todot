extends Node

static func load_resources_from_directory(path: String) -> Array:
	var result := []
	var dir = DirAccess.open(path)
	dir.open(path)
	dir.list_dir_begin() # TODOGODOT4 fill missing arguments https://github.com/godotengine/godot/pull/40547

	while true:
		var file := dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			result.append(load(path + file))

	dir.list_dir_end()

	return result


static func delete_children_from_node(node: Node) -> void:
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

