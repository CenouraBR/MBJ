extends Area2D

func _on_Coin_body_entered(body):
	if body.name == "Player":
		Global.add_coin(1)
		queue_free()