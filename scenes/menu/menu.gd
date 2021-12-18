extends Control


onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	if GameSave.is_first_boot:
		$CanvasLayer/AboutOverlay.show()
	yield(get_tree().create_timer(0.3), "timeout")
	animation_player.play("TitleShow")
	yield(animation_player, "animation_finished")
	animation_player.play("ButtonsShow")
	if !MenuBackgroundMusic.playing:
		MenuBackgroundMusic.play()
