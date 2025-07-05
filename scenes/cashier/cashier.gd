extends Node2D

class_name Cashier

@export var move_speed := 50.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cook_bar: CookBar = $CookBar

var current_customer: Customer
var counter_pos:Vector2

var item_counter_pos: Vector2
var item_request: Item

func set_customer(customer: Customer) -> void:
	current_customer = customer
	customer.being_served = true
	item_request = customer.request_item
	counter_pos = Vector2(customer.position.x, customer.position.y + 160)
	item_counter_pos = GameManager.get_item_pos(item_request)
	
	
func take_order() -> void:
	move_to_customer()
	await get_tree().create_timer(1.1).timeout
	current_customer.show_request()
	#mover a realizar el pedido
	move_to_item_position()


func move_to_customer() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position", counter_pos, 1.0)
	animation_player.play("move_animation")
	
#PAra mover el cashier a la posicion del Item	
func move_to_item_position() -> void:
	animation_player.play("move_animation")
	var tween := create_tween()
	tween.tween_property(self, "position", item_counter_pos,1.0)
	tween.tween_interval(0.3)
	tween.finished.connect(func(): start_cook_time())


#Cuando empieza a cocinar se llama la animacion Idle
#y se muestra la barra y pasamos el tiempo que demora en preparara
func start_cook_time() -> void:
	animation_player.play("idle_animation")
	cook_bar.show()
	cook_bar.cook_item(item_request.cook_time)
	

func deliver_order() -> void:
	print("Cook Completed")

#noc conectamos por medio del metodo creado on_cook_complete, para
#llamar el ocultar del cook_bar y resetear el valor
func _on_cook_bar_on_cook_completed() -> void:
	cook_bar.hide()
	cook_bar.reset_bar()
	#Para entregar el pedido al cliente
	deliver_order()
	
