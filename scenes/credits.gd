extends Control

# add your name (or username) to this list if you want to appear in the game credits!
# Contributors are listed in chronological order of pull requests from the first
# to the last.
var contributors = [
	"Sop-S",
	"Vittorio Del Bianco",
	"veonazzo",
	"Karbb",
	"Gaarco",
	"LiNuX4EvEr",
	"Andrea1141",
	"davtur19",
	"mRuggi",
	"m0rp30",
	"Iranon",
	"masmart",
	"gVirtu",
	"vclayton",
	"antocorr",
	"FlavioFS",
	"",
	'Special "Tanks" to...',
	"all the Crystal Bit community!"
]

onready var labels_container = $LabelsContainer
onready var texture_progress = $TextureProgress
const vspacing = 110
var speed = 110
var state = "idle"
var press_start_time = 0
var press_time = 0
var pressed = false
signal credits_ended


func _ready() -> void:
	get_tree().connect("screen_resized", self, "_on_screen_resized")
	var font_res = $PreviewLabel.get_font("font")
	$PreviewLabel.queue_free()
	$CPUParticles2D.position.x = Game.size.x / 2
	$CPUParticles2D.position.y = Game.size.y

	var idx = 0
	for contrib_name in contributors:
		var label: Label = create_contributor_label(contrib_name)
		label.add_font_override("font", font_res)
		label.rect_position.y = Game.size.y + idx * vspacing
		label.rect_position.x = Game.size.x / 2 - label.rect_size.x / 2
		labels_container.add_child(label)
		idx += 1
	state = "rolling"


func _process(delta: float) -> void:
	if state == "rolling":
		var idx = 0
		for label in labels_container.get_children():
			label.rect_position.y -= speed * delta
			idx += 1
			if idx == labels_container.get_child_count():
				if label.rect_global_position.y < -200:
					state = "ended"
					emit_signal("credits_ended")

	if pressed:
		press_time = OS.get_ticks_msec() - press_start_time
		texture_progress.value = press_time
		if press_time >= 300:
			Game.change_scene("res://scenes/menu/menu.tscn")

func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		if event.is_pressed():
			pressed = true
			press_start_time = OS.get_ticks_msec()
			texture_progress.show()
		else:
			pressed = false
			press_start_time = 0
			texture_progress.value = 0
			texture_progress.hide()

func _on_screen_resized():
	for label in labels_container.get_children():
		if not label is Label:
			continue
		label.rect_position.x = Game.size.x / 2 - label.rect_size.x / 2


func create_contributor_label(name: String) -> Label:
	var label = Label.new()
	label.text = name
	return label


func _on_Credits_credits_ended():
	Game.change_scene("res://scenes/menu/menu.tscn")
