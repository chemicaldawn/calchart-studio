extends Area2D

var initial_position = Vector2.ZERO

func set_initial_position(initial_position : Vector2):
	self.initial_position = initial_position
	self.position = initial_position

func update(new_position : Vector2):
	var anchor = Vector2.ZERO
	
	anchor.x = initial_position.x if (new_position.x > initial_position.x) else new_position.x
	anchor.y = initial_position.y if (new_position.y > initial_position.y) else new_position.y
	
	var size = abs(new_position - initial_position)
	
	self.position = anchor
	
	$"Visual Selector".size = size
	$"Collider".shape.size = size
	
func select_all():
	pass
