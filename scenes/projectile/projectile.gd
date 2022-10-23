extends CharacterBody2D
class_name Projectile

const MAX_VELOCITY = 600

var speed = 100 # initial velocity
var acceleration = 2
var shot_direction := Vector2()
var travelled_distance = 0
var damage = 30
var armor_piercing = 0
var additional_effect = {}

var tween: Tween


func _ready():
	pass


func _process(delta):
	if shot_direction == Vector2():
		return
	velocity = min(velocity + acceleration, MAX_VELOCITY)
	travelled_distance += velocity * delta
	if travelled_distance > 750 and tween and !tween.is_active():
		disappear()
	var collision_data = move_and_collide(velocity * shot_direction * delta)

	if collision_data and collision_data.collider.is_in_group("enemies"):
		explosion(collision_data.collider)


func _on_Explosion_animation_finished():
	await $AudioStreamPlayer2D.finished
	queue_free()



func disappear():
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(), 1.0)
	tween.tween_callback(queue_free)


func explosion(collider : CharacterBody2D):
	var enemy: Enemy = collider as Enemy
	if enemy:
		enemy.apply_status(additional_effect)
		enemy.take_damage(damage, armor_piercing)
	set_process(false)
	$AudioStreamPlayer2D.play()
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	$CPUParticles2D.visible = false
	$Explosion.visible = true
	$Explosion.play()

