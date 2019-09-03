extends KinematicBody2D
const UP = Vector2(0, -1)
export var gravity = 20
export var speed = 200
export var jump = 550
export var doublejump = false
var chave
var ajuda
var mover = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		mover.x = speed * delta
		$Zezim.flip_h = false
		if is_on_floor():
			$Zezim.play("Walking")
	elif Input.is_action_pressed("ui_left"):
		mover.x = -speed * delta
		$Zezim.flip_h = true
		if is_on_floor():
			$Zezim.play("Walking")
	else:
		mover.x = 0
		if is_on_floor():
			$Zezim.play("Idle")
		
	if is_on_floor():
		mover.y += 0
		doublejump = true
		if Input.is_action_just_pressed("ui_up"):
			mover.y = -jump * delta
	else:
		mover.y += gravity * delta
	if doublejump and Input.is_action_just_pressed("ui_up") and not(is_on_floor()):
			$Zezim.play("Jump")
			mover.y = -jump * delta
			doublejump = false
	move_and_slide(mover, UP)
	
func _process(delta):
	if Global.coin == 10 and Global.chave == true:
		Global.reset_coin()
		get_tree().change_scene("res://Scene/Cena2.tscn")
		Global.chave = false
	elif Global.coin == 8 and Global.chave == false:
		get_tree().change_scene("res://Scene/Cena3.tscn")
		Global.reset_coin()
		Global.chave2 = false
		Global.chave = true
	elif Global.coin == 7 and Global.chave2 == false:
		get_tree().change_scene("res://Scene/Win.tscn")

func _on_limite_body_entered(body):
	Global.perder_vidas()
	Global.reset_coin()
	get_tree().reload_current_scene()
	if Global.life == 0:
		Global.resetar_vidas()
		Global.reset_coin()
		get_tree().change_scene("res://Scene/GameOver.tscn")
		

func _on_Limite2_body_entered(body):
	Global.perder_vidas()
	Global.reset_coin()
	get_tree().reload_current_scene()
	if Global.life == 0:
		Global.resetar_vidas()
		Global.reset_coin()
		get_tree().change_scene("res://Scene/GameOver.tscn")


func _on_Limite3_body_entered(body):
	Global.perder_vidas()
	Global.reset_coin()
	get_tree().reload_current_scene()
	if Global.life == 0:
		Global.resetar_vidas()
		Global.reset_coin()
		get_tree().change_scene("res://Scene/GameOver.tscn")
