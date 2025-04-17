extends Node2D

class_name Cashier

@export var move_speed := 50.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func move_to_customer() -> void:
	#TODO
	#Create un Twenn
	#Move
	animation_player.play("move_animation")
	
func move_to_item_position() -> void:
	#TODO
	#Create un Twenn
	#Move
	#Stark cook time
	animation_player.play("idle_animation")
