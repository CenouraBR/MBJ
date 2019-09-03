extends Label

func _process(delta):
	update_coin()
	
func update_coin():
	self.set_text("keys: %d"%Global.coin)