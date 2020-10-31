extends KinematicBody2D
class_name Enemy
tool

signal death(money, global_position)
signal arrived_to_hitarea()

export(Resource) var enemy_resource setget set_resource

onready var path_follow = get_parent()
onready var texture_progress = $Node2D/TextureProgress
var debuff = {
	"slow": 1 # 100% of the original speed
}


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
		path_follow.set_offset(path_follow.get_offset() + enemy_resource.speed * debuff.slow * 6 * delta)


func set_hp(value: int):
	texture_progress.value = clamp(value, texture_progress.min_value, texture_progress.max_value) as int


func apply_status(missile_debuff):
	if missile_debuff.has("slow"):
		debuff.slow = (1.0 - missile_debuff.slow / 100.0)


func take_damage(value: int):
	var previous_hp: int = texture_progress.value
	set_hp(texture_progress.value - value)
	if (previous_hp <= value):
		emit_signal("death", enemy_resource.money_dropped, global_position)
		queue_free()
