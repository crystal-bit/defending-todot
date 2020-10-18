extends Node2D

var call_buttons = []

func _ready():
	var id = 0
	for b in get_children():
		b.connect("enemy_start_timeout", self, "_on_enemy_start_timeout")
		b.id = id
		id += 1
		call_buttons.append(b)

func _input(event):
	if event is InputEventKey:
		call_buttons[0].init_call_wave(5, "Goblin x3")
		call_buttons[1].init_call_wave(10, "Armored Tank")
		call_buttons[2].init_call_wave(15, "Lemmings infinite number at random generated time")
		call_buttons[3].init_call_wave(20, "Gremlins: number depends on water after midnight!")

func _on_enemy_start_timeout(ecb: EnemyCallButton):
#	print(ecb.id, ", ", ecb.wave_info.text)
	for b in call_buttons:
		if b.id != ecb.id:
			b.dismount()


