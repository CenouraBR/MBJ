extends Node2D

var iniciar = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		iniciar = true
	elif iniciar:
		get_tree().change_scene("res://Scene/World.tscn")
		iniciar = false