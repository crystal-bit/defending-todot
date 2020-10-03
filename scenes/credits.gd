extends Control

# add your name to this list to appear in the game credits
var contributors = [
	"davcri",
	"veonazzo"
]

onready var labels_container = $LabelsContainer
const vspacing = 60
var speed = 150
var state = "idle"
signal credits_ended


func _ready() -> void:
	get_tree().connect("screen_resized", self, "_on_screen_resized")
	var font_res = $PreviewLabel.get_font("font")
	$PreviewLabel.queue_free()
	
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
	Game.change_scene("res://scenes/main.tscn")
