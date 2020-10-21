extends Node2D
class_name Tower

export(Resource) var tower_resource

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


func initialise(_resource: Resource):
	tower_resource = _resource


func _ready() -> void:
	load_resource_data(tower_resource)


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
	if target == null and body is Enemy:
		change_state(TOWER_STATES.ATTACKING)
		target = body
		fire_timer.start()

func _on_Area2D_body_exited(body):
	if body == target:
		change_state(TOWER_STATES.GAMEPLAY)
		target = null

func _on_FireTimer_timeout():
	if state == TOWER_STATES.ATTACKING:
		fire()
		fire_timer.start()


func change_state(new_state: int):
	assert(new_state in TOWER_STATES.values(), "Tower state not in TOWER_STATES list")
	state = new_state


func set_rally_point(position : Vector2):
	rally_point.global_position = position


func upgrade():
	# TODO
	pass


func load_resource_data(tower_resource : Tower_Resource):
	sprite.texture = tower_resource.texture
	attack_area_shape.shape.radius = tower_resource.attack_radius
	fire_timer.wait_time = tower_resource.fire_rate



func fire():
	print("firing")
	# add fire method
