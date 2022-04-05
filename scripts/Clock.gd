extends Node2D

export var start_time = 30

var time
var total = 0
var explosion_wav = preload("res://audio/explosion.wav")


func _ready():
	reset()


func _on_Timer_timeout():
	time -= 1
	total += 1
	update_time()
	if time == 0:
		stop()


func stop():
	get_tree().paused = true
	total += time
	$"../HUD/Store".hide()
	$"../Explosion".show()
	$"../HUD/GameOver".dialog_text = \
		"You delayed the inevitable explosion for %d:%02d." \
		% [total / 60, total % 60]
	$"../HUD/GameOver".show()
	$"../HUD/Audio".stream = explosion_wav
	$"../HUD/Audio".play()


func add_time(seconds):
	time += seconds
	total += seconds
	update_time()


func reset():
	time = start_time
	update_time()
	$Timer.start()


func update_time():
	$Label.text = "%d:%02d" % [time / 60, time % 60]
