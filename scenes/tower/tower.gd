extends Node2D
class_name Tower

export(TowerType.Type) var tower_type
export(int) var level
export(int) var attack_radius setget _set_attack_radius
export(int) var damage
export(int) var armor_piercing
export(int) var fire_rate

#optional attributes
export(int) var slow_effect
export(int) var damage_area

onready var attack_area_shape = $AttackRange/Area2D/CollisionShape2D
onready var rally_point = $RallyPoint
onready var sprite = $Sprite

	
func _ready() -> void:
	var tower_resource : Tower_Resource = TowerManager.towers_by_level[level][tower_type]
	_set_tower_attributes(tower_resource)
	_set_tower_sprite(tower_resource)
	
	
func _set_tower_attributes(tower_resource : Tower_Resource):
	attack_radius = tower_resource.attack_radius
	damage = tower_resource.damage
	armor_piercing = tower_resource.armor_piercing
	armor_piercing = tower_resource.armor_piercing
	fire_rate = tower_resource.fire_rate
	slow_effect = tower_resource.slow_effect
	damage_area = tower_resource.damage_area
	update()
	
func _set_tower_sprite(tower_resource : Tower_Resource):
	sprite.texture = tower_resource.sprite
	

func _draw() -> void:
	var blue_color : Color = Color.blue
	blue_color.a = 0.5
	draw_circle(Vector2.ZERO, attack_radius, blue_color)
	
	
func _set_attack_radius(attack_radius : int):
	attack_area_shape.shape.radius = attack_radius
	attack_radius = attack_radius
	
	
func set_rally_point(position : Vector2):
	rally_point.global_position = position
	
	
func upgrade():
	level = level + 1
	var tower_resource : Tower_Resource = TowerManager.towers_by_level[level][tower_type]
	_set_tower_attributes(tower_resource)
	_set_tower_sprite(tower_resource)
