extends Area2D


func _on_HitArea_body_entered(body):
	body.queue_free()
	#TODO: update current player hp
	pass 
