extends Node2D
class_name Tower

@export var tower_resource: Tower_Resource

const TOWER_ROTATION_OFFSET = PI / 2

@onready var attack_range_area: Area2D = $AttackRange/AttackRange
@onready var rally_point = $RallyPoint
@onready var sprite = $Sprite2D
@onready var fire_timer = $FireTimer
@onready var missile_scene = preload("res://scenes/projectile/missile/missile.tscn")
@onready var bullet_scene = preload("res://scenes/projectile/bullet/bullet.tscn")
@onready var sierra_scene = preload("res://scenes/projectile/sierra_bullet/sierra_bullet.tscn")
@onready var anim = $AnimationPlayer

var alpha_area_show : float = .5
var alpha_area_hide : float = 0
var alpha_area = alpha_area_hide

var bodies_in_range = []
var target

enum TOWER_STATES {
	PREVIEW,
	GAMEPLAY,
	ATTACKING
}

var state = TOWER_STATES.PREVIEW


func initialise(_resource: Resource):
	tower_resource = _resource


func _ready() -> void:
	attack_range_area.monitoring = false
	load_resource_data(tower_resource)


func _process(delta):
	if target is Enemy:
		var to_target = (target.global_position - global_position).normalized()
		var rotation_to_target = to_target.angle() + TOWER_ROTATION_OFFSET
		sprite.rotation = lerp_angle(sprite.rotation, rotation_to_target, 0.25)


func _draw() -> void:
	var blue_color: Color = Color.BLUE
	blue_color.a = alpha_area
	draw_circle(Vector2.ZERO, tower_resource.attack_radius, blue_color)


func _on_AttackRangeShowArea_mouse_entered() -> void:
	alpha_area = alpha_area_show
	queue_redraw()


func _on_AttackRangeShowArea_mouse_exited() -> void:
	alpha_area = alpha_area_hide
	queue_redraw()


func _on_Area2D_body_entered(body):
	if body is Enemy:
		bodies_in_range.append(body)
		if target == null:
			change_state(TOWER_STATES.ATTACKING)
			target = body
			fire_timer.start()


func _on_Area2D_body_exited(body):
	if body is Enemy:
		bodies_in_range.erase(body)
		if bodies_in_range.size() > 0: #if the array isn't empty
			target = bodies_in_range.front()
		else:
			change_state(TOWER_STATES.GAMEPLAY)
			target = null


func _on_FireTimer_timeout():
	if state == TOWER_STATES.ATTACKING:
		fire(target)
		fire_timer.start()


func change_state(new_state: int):
	assert(new_state in TOWER_STATES.values()) #,"Tower state not in TOWER_STATES list")
	if new_state == TOWER_STATES.GAMEPLAY:
		attack_range_area.monitoring = true
	if new_state == TOWER_STATES.PREVIEW:
		anim.stop()
		anim.play("flash")
	else:
		anim.stop()
		anim.play("idle")
	state = new_state


func set_rally_point(position : Vector2):
	rally_point.global_position = position


func load_resource_data(p_tower_resource : Tower_Resource):
	sprite.texture = p_tower_resource.texture
	attack_range_area.find_child("CollisionShape2D").shape.radius = p_tower_resource.attack_radius
	fire_timer.wait_time = p_tower_resource.fire_rate


func fire(_target: Enemy): #when finished match tower_type and level of the tower resource
	var ammo = get_missile_by_tower_type(tower_resource.tower_type)
	var to_target = (_target.global_position - global_position).normalized()
	ammo.shot_direction = to_target
	ammo.set_position(position)
	ammo.set_rotation(to_target.angle() + TOWER_ROTATION_OFFSET)
	ammo.damage = tower_resource.damage
	ammo.armor_piercing = tower_resource.armor_piercing
	ammo = apply_additional_effect(ammo)
	add_child(ammo)


func get_missile_by_tower_type(tower_type: int):
	match tower_type:
		TowerType.Type.BUNKER:
			return bullet_scene.instantiate()
		TowerType.Type.MISSILE:
			return sierra_scene.instantiate()
		TowerType.Type.SNIPER:
			return missile_scene.instantiate()
		_:
			return missile_scene.instantiate()


func apply_additional_effect(obj: Projectile):
	var tres: Tower_Resource = tower_resource
	match tres.tower_type:
		TowerType.Type.BUNKER:
			obj.additional_effect["slow"] = tres.slow_effect
	return obj
