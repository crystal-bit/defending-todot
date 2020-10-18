extends KinematicBody2D
class_name Enemy

onready var path_follow = get_parent()
onready var speed = 0

export(EnemyTypes.ENEMY_TYPES) var type setget set_type
export(EnemyTypes.GRADE) var grade setget set_grade


func initialise(_type, _grade):
	type = _type
	grade = _grade
	

func _ready():
	var enemy_resource: EnemyResource = ResourceManager.enemies_by_type[type][grade]
	load_resource_data(enemy_resource)


func load_resource_data(enemy_resource: EnemyResource):
	var sprite = get_node_or_null("Sprite")
	if sprite == null:
		return
	sprite.texture = enemy_resource.texture
	speed = enemy_resource.speed * 2


func set_type(value):
	type = value
	_update_enemy_resource()


func set_grade(value):
	grade = value
	_update_enemy_resource()
	
	
func _update_enemy_resource():
	var enemy_resource: EnemyResource = ResourceManager.enemies_by_type[type][grade]
	load_resource_data(enemy_resource)


func _physics_process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
