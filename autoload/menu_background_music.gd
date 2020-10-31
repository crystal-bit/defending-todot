extends AudioStreamPlayer


func fade_out():
	$Tween.interpolate_property(self, "volume_db", self.volume_db, -80, 4.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield($Tween, "tween_completed")
	stop()
	volume_db = 0
