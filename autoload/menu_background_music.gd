extends AudioStreamPlayer


func fade_out():
	var volume_tween = create_tween()
#	Tween.TRANS_LINEAR, Tween.EASE_IN
	volume_tween.set_ease(Tween.EASE_IN)
	volume_tween.set_trans(Tween.TRANS_LINEAR)
	volume_tween.tween_property(self, "volume_db", -80, 4.5)
	volume_tween.tween_callback(stop)
	volume_db = 0
