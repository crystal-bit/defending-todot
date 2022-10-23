extends CharacterBody2D
class_name Enemy
@tool

signal death(money, global_position)
signal arrived_to_hitarea()

@export var enemy_resource: EnemyResource : set=set_resource

@onready var path_follow: PathFollow2D = get_parent()
@onready var texture_progress = $Node2D/TextureProgressBar
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
	var sprite = get_node_or_null("Sprite2D")
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
		path_follow.progress = path_follow.progress + enemy_resource.speed * debuff.slow * 6 * delta


func set_hp(value: int):
	texture_progress.value = clamp(value, texture_progress.min_value, texture_progress.max_value) as int


func apply_status(missile_debuff):
	if missile_debuff.has("slow"):
		debuff.slow = (1.0 - missile_debuff.slow / 100.0)


func take_damage(damage: float, armor_piercing: float):
	var previous_hp: int = texture_progress.value
	var damage_multiplier : float = abs(100.0 / (100.0 + (enemy_resource.armor * (1 - armor_piercing))))
	if damage_multiplier != 1:
		damage_multiplier = 1 - damage_multiplier
	var final_damage = damage * damage_multiplier
	set_hp(previous_hp - final_damage)
	if (previous_hp <= damage):
		emit_signal("death", enemy_resource.money_dropped, global_position)
		queue_free()
