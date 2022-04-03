extends Area2D

signal trash
signal money

export var speed = 1000

var screen


func _ready():
	screen = get_viewport_rect().size
# warning-ignore:return_value_discarded
	connect("trash", $"../HUD", "_on_trash")
# warning-ignore:return_value_discarded
	connect("money", $"../HUD", "_on_money")


func _process(delta):
	var velocity = 0
	
	if Input.is_action_pressed("left"):
		velocity -= 1
	if Input.is_action_pressed("right"):
		velocity += 1
	position.x = clamp(
		position.x + velocity * speed * delta,
		screen.x / 2,
		screen.x)


func _on_Wheelbarrow_body_entered(body):
	if body.is_in_group("trash"):
		emit_signal("trash")
		body.queue_free()
	elif body.is_in_group("money"):
		emit_signal("money")
		body.queue_free()
