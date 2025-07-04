extends Node2D

class_name Customer

#Para actualizar las texturas de los nodos definidos y asi crear personajes aleatorios con los recursos que estan en en la carpeta data
@onready var body: Sprite2D = %Body
@onready var face: Sprite2D = %Face
@onready var hand_left: Sprite2D = %HandLeft
@onready var hand_righ: Sprite2D = %HandRigh
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var item_box: Control = $ItemBox
@onready var item_img: TextureRect = %ItemImg
@onready var item_label: Label = %ItemLabel

var request_item: Item
var request_quantity: int
var current_order_status: int

var counter_pos: Vector2
#Para validar si cliente ya esta siendo atendido
var being_served: bool

func init_custmer(item: Item, quantity: int) -> void:
		request_item = item
		request_quantity = quantity
		current_order_status= quantity
	
	
func set_sprites(data: CuestomerData) -> void:
	body.texture = data.body
	face.texture = data.face
	hand_left.texture = data.hand
	hand_righ.texture = data.hand

func show_request() ->void:
	item_box.show()
	item_img.texture = request_item.sprite
	item_label.text = str(request_quantity)
	

func play_move_anim() -> void:
	animation_player.play("move_animation")
	
func move_to_counter()-> void:
	play_move_anim()
	var counter_top_pos:=Vector2(counter_pos.x, position.y)
	var tween:= create_tween()
	tween.tween_property(self,"position",counter_top_pos,1.0)
	tween.tween_interval(0.2)
	tween.tween_property(self,"position",counter_pos,1.0)
	tween.tween_interval(0.5)
	tween.finished.connect(
		func():
			animation_player.play("idle_animation")
			GameManager._on_customer_request.emit(self)
			)
