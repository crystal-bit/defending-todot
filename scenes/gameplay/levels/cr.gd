extends Sprite2D

var tween: Tween
var sfx: AudioStreamPlayer

func _ready() -> void:
	sfx = AudioStreamPlayer.new()
	add_child(sfx)
	sfx.stream = load("res://assets/audio/458396__befig__monkey-cry.ogg")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if event.position.distance_to(position) < 20:
				DO_IT()
				print("TODO: easter egg")


func DO_IT():
	return
#	z_index = 100
#	var tween = create_tween()
#	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD) # Tween.TRANS_QUAD, Tween.EASE_IN_OUT
#	tween.tween_property(self, "scale", Vector2(60, 60), 0.6)
#	tween.start()
#	sfx.play()
#	await tween.finished
#	tween.interpolate_property(self, "scale", scale, Vector2(2, 2), 0.4, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
#	tween.start()
#	await tween.finished
#	tween.interpolate_property(self, "position", position, Vector2(-100, position.y - 10), 1.0, Tween.TRANS_EXPO, Tween.EASE_OUT)
#	tween.start()
#	await tween.finished
#	sfx.stop()
