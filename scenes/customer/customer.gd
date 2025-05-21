extends Node2D

class_name Customer

#Para actualizar las texturas de los nodos definidos y asi crear personajes aleatorios con los recursos que estan en en la carpeta data
@onready var body: Sprite2D = %Body
@onready var face: Sprite2D = %Face
@onready var hand_left: Sprite2D = %HandLeft
@onready var hand_righ: Sprite2D = %HandRigh
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func set_sprites(data: CuestomerData) -> void:
	body.texture = data.body
	face.texture = data.face
	hand_left.texture = data.hand
	hand_righ.texture = data.hand

func play_move_anim() -> void:
	animation_player.play("move_animation")
