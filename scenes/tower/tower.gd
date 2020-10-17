extends Node2D
class_name Tower

export(TowerType.Type) var tower_type
export(int) var level

var attack_radius: int setget _set_attack_radius
var damage: int
var armor_piercing: int
var fire_rate: int
# optional attributes
var slow_effect: int
var damage_area: int
var description: String

onready var attack_area_shape = $AttackRange/Area2D/CollisionShape2D
onready var rally_point = $RallyPoint
onready var sprite = $Sprite
onready var fire_timer = $FireTimer

var alpha_area_show : float = .5
var alpha_area_hide : float = 0
var alpha_area = alpha_area_hide

var target

enum TOWER_STATES {
	PREVIEW,
	GAMEPLAY,
	ATTACKING
}

var state = TOWER_STATES.PREVIEW


func _ready() -> void:
	assert(level != 0, "level cannot be 0. Use initialise method before adding this scene to the tree.")
	var tower_resource: Tower_Resource = ResourceManager.towers_by_level[level][tower_type]
	_set_tower_attributes(tower_resource)
	_set_attack_radius(tower_resource.attack_radius)
	sprite.texture = tower_resource.texture
	fire_timer.wait_time = tower_resource.fire_rate


func _draw() -> void:
	var blue_color: Color = Color.blue
	blue_color.a = alpha_area
	draw_circle(Vector2.ZERO, attack_radius, blue_color)


func _on_AttackRangeShowArea_mouse_entered() -> void:
	alpha_area = alpha_area_show
	update()


func _on_AttackRangeShowArea_mouse_exited() -> void:
	alpha_area = alpha_area_hide
	update()

func _on_Area2D_body_entered(body):
	if body is Enemy:
		change_state(2)
		target = body
		fire_timer.start()

func _on_Area2D_body_exited(body):
	if body == target:
		change_state(1)
		target = null

func _on_FireTimer_timeout():
	if state == TOWER_STATES.ATTACKING:
		fire()
		fire_timer.start()

func initialise(_type, _level):
	tower_type = _type # TowerType.Type
	level = _level # int


func change_state(new_state: int):
	assert(new_state in TOWER_STATES.values(), "Tower state not in TOWER_STATES list")
	state = new_state


func set_rally_point(position : Vector2):
	rally_point.global_position = position


func upgrade():
	level = level + 1
	var tower_resource : Tower_Resource = ResourceManager.towers_by_level[level][tower_type]
	_set_tower_attributes(tower_resource)
	sprite.texture = tower_resource.texture


func _set_tower_attributes(tower_resource : Tower_Resource):
	attack_radius = tower_resource.attack_radius
	damage = tower_resource.damage
	armor_piercing = tower_resource.armor_piercing
	armor_piercing = tower_resource.armor_piercing
	fire_rate = tower_resource.fire_rate
	slow_effect = tower_resource.slow_effect
	damage_area = tower_resource.damage_area
	description = tower_resource.description


func _set_attack_radius(radius: int):
	attack_area_shape.shape.radius = radius
	attack_radius = radius

func fire():
	print("firing")
	# add fire method
