extends Resource
class_name Tower_Resource


export(TowerType.Type) var tower_type
export(int) var level
export(Texture) var texture
export(int) var attack_radius
export(int) var damage
export(int, 0, 100) var armor_piercing
export(float) var fire_rate

#optional attributes
export(int, 0, 100) var slow_effect
export(int, 0, 100) var damage_area
export(int) var cost
