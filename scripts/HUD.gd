extends CanvasLayer

var funds = 0


func _ready():
	update_funds()


func _on_trash():
	funds -= 10
	update_funds()


func _on_money():
	funds += 1
	update_funds()


func update_funds():
	$Store/Label.text = "Funds: $" + str(funds)


func _on_Reset_pressed():
	if funds >= 50:
		funds -= 50
		$"../Clock".reset()


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
