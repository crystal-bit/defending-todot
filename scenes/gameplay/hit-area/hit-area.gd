extends Area2D
class_name HitArea

signal enemy_arrived


func _on_HitArea_body_entered(body):
	if body is Enemy:
		emit_signal("enemy_arrived", body)
		body.queue_free()
		# TODO: update current player hp
