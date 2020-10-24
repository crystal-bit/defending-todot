extends KinematicBody2D
class_name Enemy
tool

export(Resource) var enemy_resource setget set_resource

onready var path_follow = get_parent()
onready var texture_progress = $Node2D/TextureProgress


signal arrived_to_hit_area(enemy)


func initialise(enemy_res):
	self.enemy_resource = enemy_res


func set_resource(res):
	enemy_resource = res
	load_resource_data(enemy_resource)


func _ready():
	load_resource_data(enemy_resource)
	texture_progress.max_value = enemy_resource.hp
	texture_progress.value = enemy_resource.hp


func load_resource_data(enemy_resource: EnemyResource):
	var sprite = get_node_or_null("Sprite")
	if sprite == null:
		return
	sprite.texture = enemy_resource.texture


func set_type(value):
	enemy_resource.type = value


func set_grade(value):
	enemy_resource.grade = value


func _physics_process(delta):
	if not Engine.is_editor_hint():
		$Node2D.global_rotation = 0
		path_follow.set_offset(path_follow.get_offset() + enemy_resource.speed * delta)

#func set_hp():
#	texture_progress.value = hp
#	This is an example to update the TextureProgress with the hp value.
