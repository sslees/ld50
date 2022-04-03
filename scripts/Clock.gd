extends Node2D

export var start_time = 30

var time


func _ready():
	reset()


func _on_Timer_timeout():
	time -= 1
	update_time()
	if time == 0:
		get_tree().paused = true

# warning-ignore:integer_division
		var seconds = OS.get_ticks_msec() / 1000

		$"../HUD/Store".hide()
		$"../Explosion".show()
		$"../HUD/GameOver".dialog_text = \
			"You delayed the inevitable explosion for %d:%02d." \
			% [seconds / 60, seconds % 60]
		$"../HUD/GameOver".show()


func add_time(seconds):
	time += seconds
	update_time()


func reset():
	time = start_time
	update_time()
	$Timer.start()


func update_time():
	$Label.text = "%d:%02d" % [time / 60, time % 60]
