extends Label

func _process(delta):
	update_life()
	
func update_life():
	self.set_text("Biru Biru life: %d"%Global.life)