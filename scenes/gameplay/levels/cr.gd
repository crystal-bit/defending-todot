extends Sprite

var tween: Tween
var sfx: AudioStreamPlayer

func _ready() -> void:
	tween = Tween.new()
	sfx = AudioStreamPlayer.new()
	add_child(sfx)
	sfx.stream = load("res://assets/audio/458396__befig__monkey-cry.ogg")
	add_child(tween)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if event.position.distance_to(position) < 20:
				DO_IT()


func DO_IT():
	z_index = 100
	tween.interpolate_property(self, "scale", scale, Vector2(60, 60), 0.6, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
	sfx.play()
	yield(tween, "tween_completed")
	tween.interpolate_property(self, "scale", scale, Vector2(2, 2), 0.4, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(self, "position", position, Vector2(-100, position.y - 10), 1.0, Tween.TRANS_EXPO, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	sfx.stop()
