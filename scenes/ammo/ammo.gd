extends KinematicBody2D
class_name Ammo

var velocity = Vector2(0.0, 0.0)
var acceleration = Vector2(0.0, 0.0)
var shot_direction


func _ready():
	acceleration = Vector2(1.0, 1.0)


func _process(delta):
	if !shot_direction:
		return
	velocity += acceleration
	var dynamics = move_and_collide(velocity * shot_direction * delta)
	
	if dynamics:
		if dynamics.collider.is_in_group("enemies"):
			queue_free() #remove scene from the tree after the strike
