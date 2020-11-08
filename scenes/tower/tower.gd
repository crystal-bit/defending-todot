extends Node2D
class_name Tower

export(Resource) var tower_resource

const TOWER_ROTATION_OFFSET = PI / 2

onready var attack_range_area: Area2D = $AttackRange/AttackRange
onready var rally_point = $RallyPoint
onready var sprite = $Sprite
onready var fire_timer = $FireTimer
onready var missile_scene = preload("res://scenes/projectile/missile/missile.tscn")
onready var bullet_scene = preload("res://scenes/projectile/missile/bullet.tscn")

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
	var blue_color: Color = Color.blue
	blue_color.a = alpha_area
	draw_circle(Vector2.ZERO, tower_resource.attack_radius, blue_color)


func _on_AttackRangeShowArea_mouse_entered() -> void:
	alpha_area = alpha_area_show
	update()


func _on_AttackRangeShowArea_mouse_exited() -> void:
	alpha_area = alpha_area_hide
	update()

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


func get_show_direction():
	pass


func change_state(new_state: int):
	assert(new_state in TOWER_STATES.values(), "Tower state not in TOWER_STATES list")
	if new_state == TOWER_STATES.GAMEPLAY:
		attack_range_area.monitoring = true
	state = new_state


func set_rally_point(position : Vector2):
	rally_point.global_position = position


func upgrade():
	# TODO
	pass


func load_resource_data(p_tower_resource : Tower_Resource):
	sprite.texture = p_tower_resource.texture
	attack_range_area.find_node("CollisionShape2D").shape.radius = p_tower_resource.attack_radius
	fire_timer.wait_time = p_tower_resource.fire_rate


func fire(_target: Enemy): #evaluate to do a sub function to assign the correct type of ammo
	var ammo
	if tower_resource.tower_type == 2: #if sniper, missile
		ammo = missile_scene.instance()
	elif tower_resource.tower_type == 0: #if bunker, bullet
		ammo = bullet_scene.instance()
	else:  #we don't have other types of projectiles
		ammo = missile_scene.instance()
	var to_target = (_target.global_position - global_position).normalized()
	ammo.shot_direction = to_target
	ammo.set_position(position)
	ammo.set_rotation(to_target.angle() + TOWER_ROTATION_OFFSET)
	ammo.damage = tower_resource.damage
	ammo = apply_additional_effect(ammo)
	add_child(ammo)
	



func apply_additional_effect(obj: Projectile):
	var tres: Tower_Resource = tower_resource
	match tres.tower_type:
		TowerType.Type.BUNKER:
			obj.additional_effect["slow"] = tres.slow_effect
	return obj


