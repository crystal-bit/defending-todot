@tool
class_name EnemyCallButton
extends Area2D

signal next_wave_requested(enemy_call_button)

@onready var texture_progress = $Visible/TextureProgressBar
@onready var animation_player = $AnimationPlayer
@onready var popup_info = $PopupInfo
@onready var wave_info = $PopupInfo/MarginContainer/VBoxContainer/WaveInfo
@onready var collision_shape = $CollisionShape2D
@onready var texture_select = $Visible/TextureSelect

@export var id: int
@export_range(0, 360) var direction : set = on_dir_changed # setget on_dir_changed

var project_size_y = ProjectSettings.get_setting("display/window/size/viewport_height")

var wait_time: float
var enemy_wave_description: String
var call_button_selected: bool = false
var mouse_inside_area: bool

var can_process: bool = false


func _ready():
	var _ret = get_viewport().connect("size_changed",Callable(self,"_on_screen_resize"))
	visible = false


func _process(delta):
	if can_process:
		texture_progress.value += delta * 1000
		if texture_progress.value >= texture_progress.max_value:
			end_work()


func init_call_wave(_wait_time: float, _enemy_wave_description: String):
	wait_time = _wait_time
	enemy_wave_description = tr(_enemy_wave_description)
	texture_progress.max_value = wait_time * 1000
	texture_progress.value = 0
	wave_info.text = _enemy_wave_description
	call_button_selected = false
	texture_select.visible = false
	popup_info.visible = false
	animation_player.play("Scale")
	can_process = true
	modulate = Color(1, 1, 1, 1)
	visible = true


func _unhandled_input(event: InputEvent) -> void:
	if can_process:
		if event is InputEventMouseButton and event.pressed:
			if not mouse_inside_area:
				call_button_selected = false
				texture_select.visible = false
				popup_info.visible = false


func _on_EnemyCallButton_mouse_entered():
	mouse_inside_area = true


func _on_EnemyCallButton_mouse_exited():
	mouse_inside_area = false


func _on_EnemyCallButton_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT:
			if _event.pressed:
				if call_button_selected:
					end_work()
				else:
					call_button_selected = true
					texture_select.visible = true
					show_popup_info()


func show_popup_info():
	popup_info.visible = true
	update_size()
# May not work if project window strech mode is changed !!
	var arrow_gap = 10
	if popup_info.size.x + collision_shape.shape.radius + arrow_gap < position.x:
		popup_info.position.x = position.x - (popup_info.size.x + collision_shape.shape.radius + arrow_gap)
	else:
		popup_info.position.x = position.x + collision_shape.shape.radius + arrow_gap
	if position.y - collision_shape.shape.radius + popup_info.size.y > project_size_y:
		popup_info.position.y = position.y + collision_shape.shape.radius - popup_info.size.y
	else:
		popup_info.position.y = position.y - collision_shape.shape.radius


func update_size():
	pass
#	popup_info.set_as_minsize()
#	popup_info.minimum_size_changed()


func end_work():
	emit_signal("next_wave_requested", self)
	dismount()


func dismount():
	can_process = false
	popup_info.visible = false
	animation_player.stop(false)
	var tween: Tween = create_tween()
	tween.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "scale", Vector2(1.5, 1.5), 0.1)
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.1)
	await tween.finished
	visible = false
	modulate = Color(1, 1, 1, 1)
	scale = Vector2(1, 1)


func on_dir_changed(new_direction: int):
	$Visible/TextureDirection.rotation = new_direction
	direction = new_direction


func _on_screen_resize():
	update_size()

