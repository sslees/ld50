extends Area2D

signal trash
signal money

export var speed = 1000

var screen
var down = false


func _ready():
	screen = get_viewport_rect().size
# warning-ignore:return_value_discarded
	connect("trash", $"../HUD", "_on_trash")
# warning-ignore:return_value_discarded
	connect("money", $"../HUD", "_on_money")


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		down = event.pressed


func _process(delta):
	var dist = speed * delta
	var dir = 0
	var pos = get_viewport().get_mouse_position().x

	if Input.is_action_pressed("left") or \
			down and screen.x / 2 < pos and pos < self.position.x - dist:
		dir -= 1
	if Input.is_action_pressed("right") or \
			down and self.position.x + dist < pos and pos < screen.x:
		dir += 1
	position.x = clamp(
		position.x + dir * dist,
		screen.x / 2,
		screen.x)


func _on_Wheelbarrow_body_entered(body):
	if body.is_in_group("trash"):
		emit_signal("trash")
		body.queue_free()
	elif body.is_in_group("money"):
		emit_signal("money")
		body.queue_free()
