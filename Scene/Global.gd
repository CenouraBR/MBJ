extends Node

var life = 3
var coin = 0
var chave = true
var chave2 = true

func add_coin(acount: int):
	coin += acount

func reset_coin():
	coin = 0
	
func perder_vidas():
	life -=1
	
func resetar_vidas():
	life = 3
