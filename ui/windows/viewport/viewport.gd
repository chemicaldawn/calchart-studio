extends Control

func scale_field(scale_factor : float):
	
	%"Field Image".size *= scale_factor
	%"Field Image".custom_minimum_size = %"Field Image".size

func _process(delta):
	if(Input.is_action_just_pressed("Zoom In")):
		scale_field(1.5)
		
	if(Input.is_action_just_pressed("Zoom Out")):
		scale_field(0.5)
