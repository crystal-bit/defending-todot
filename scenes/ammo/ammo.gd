extends KinematicBody2D

var velocity = Vector2(0.0, 0.0)
var acceleration = Vector2(0.0, 0.0)
var direction
var hit

func _ready():
	hit = false
	acceleration = Vector2(1.0, 1.0)


func _process(delta):
	velocity += acceleration
	direction = get_parent().shot_direction
	
	var dynamics = move_and_collide(velocity * direction * delta)
	
	if dynamics :
		if dynamics.collider.is_in_group("enemies") :
			hit = true
			hide()
			queue_free() #remove scene from the tree after the strike
