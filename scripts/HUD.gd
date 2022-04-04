extends CanvasLayer

var funds = 0


func _ready():
	$GameOver.get_ok().text = "Play Again"
	update_info()


func _on_trash():
	funds -= 10
	update_info()


func _on_money():
	funds += 1
	update_info()


func update_info():
	$Store/Info/Funds.text = "Funds: $" + str(funds)
	$Store/Info/Speed.text = "Speed: " + str(1 / $"../DropTimer".wait_time)


func _on_End_pressed():
	$"../Clock".stop()


func _on_Add1M_pressed():
	if funds >= 30:
		funds -= 30
		$"../Clock".add_time(60)


func _on_Add15S_pressed():
	if funds >= 10:
		funds -= 10
		$"../Clock".add_time(15)


func _on_DropMore_pressed():
	if funds >= 5:
		funds -= 5
		$"../DropTimer".wait_time *= 0.5


func _on_DropLess_pressed():
	if funds >= 20:
		funds -= 20
		$"../DropTimer".wait_time *= 2


func _on_NoTrash_pressed():
	if funds >= 100:
		funds -= 100
		get_parent().trash = false
		yield(get_tree().create_timer(30), "timeout")
		get_parent().trash = true


func _on_GameOver_confirmed():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
