class_name Tower_Resource
extends Resource


@export var tower_type: TowerType.Type # (TowerType.Type)
@export var level: int
@export var texture: Texture2D
@export var attack_radius: int
@export var damage: int
@export_range(0, 100) var armor_piercing
@export var fire_rate: float
@export var description: String
@export var locked: bool

#optional attributes
@export_range(0, 100) var slow_effect
@export_range(0, 100) var damage_area
@export var cost: int


func get_readable_name():
	return TowerType.Type.keys()[tower_type]
