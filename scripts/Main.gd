extends Node2D

export(PackedScene) var money_scene
export(PackedScene) var trash_scene

export var trash_ratio = 0.2

var trash = true
var screen


func _ready():
	randomize()
	screen = get_viewport_rect().size


func _on_DropTimer_timeout():
	var drop = (
		trash_scene if trash and randf() < trash_ratio else money_scene
	).instance()

	drop.position = Vector2(
		rand_range(screen.x * 1.1 / 2 , screen.x * 1.9 / 2),
		screen.y / -2)
	add_child(drop)
