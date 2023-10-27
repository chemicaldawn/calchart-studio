extends Camera2D

@export
var scroll_speed = 1000

var target_position = Vector2.ZERO

func _process(delta):
	
	var planar_vector = Vector2.ZERO
	
	if(Input.is_action_just_pressed("Scroll Left")):
		planar_vector.x -= 1
	if(Input.is_action_just_pressed("Scroll Right")):
		planar_vector.x += 1
	if(Input.is_action_just_pressed("Scroll Up")):
		planar_vector.y -= 1
	if(Input.is_action_just_pressed("Scroll Down")):
		planar_vector.y += 1
		
	target_position += delta * planar_vector * scroll_speed
	
	#lerp existing position
	position = lerp(position,target_position,0.25)
