extends KinematicBody2D
class_name Ammo

var velocity = Vector2(0.0, 0.0)
var acceleration = Vector2(0.0, 0.0)
var shot_direction


func _ready():
	acceleration = Vector2(1.0, 1.0)
	$LifeTimer.start()


func _process(delta):
	if !shot_direction:
		return
	velocity += acceleration
	var dynamics = move_and_collide(velocity * shot_direction * delta)
	
	if dynamics:
		if dynamics.collider.is_in_group("enemies"):
			explosion()


func _on_Explosion_animation_finished():
	queue_free()


func _on_LifeTimer_timeout():
	explosion()


func explosion():
	shot_direction = 0
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	$Explosion.visible = true
	$Explosion.play()
