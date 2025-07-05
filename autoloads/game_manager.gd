extends Node

signal _on_customer_request(customer: Customer)

@export var coffee: Item
@export var burger: Item

var coffe_counter_pos := Vector2(425,1250)
var burger_counter_pos := Vector2(680,1250)

func get_random_item()-> Item:
	var items: Array = [coffee, burger]
	return items.pick_random()


func get_item_pos(item: Item) -> Vector2:
	match item.type:
		Item.ItemType.Coffe:
			return coffe_counter_pos
		Item.ItemType.Burger:
			return burger_counter_pos
	return Vector2.ZERO
