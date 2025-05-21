extends Node

class_name CustomerManager

@export var spawn_positions: Array[Marker2D]
@export  var customer_sprites: Array[CuestomerData]
@export var customer_scene: PackedScene

func _ready() -> void:
	spawn_customer()

func spawn_customer() -> void:
	var customer: Customer = customer_scene.instantiate()
	add_child(customer)
	
	#Get Random sprites
	var sprite_data: CuestomerData = customer_sprites.pick_random()
	customer.set_sprites(sprite_data)
	
	#Para instanciar cliente en uno  de los Marker aleatoriamente y hacer que se mueve
	var random_start_pos: Marker2D = spawn_positions.pick_random()
	customer.global_position = random_start_pos.position
	customer.play_move_anim()
	var tween: = create_tween()
	tween.tween_property(customer, "position", customer.position + Vector2.RIGHT*1300, 5.5)
	tween.finished.connect(func(): customer.queue_free())


func _on_spaw_timer_timeout() -> void:
	spawn_customer()
