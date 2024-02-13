extends Node2D

var mode : CalChart.VIEWPORT_MODE = CalChart.VIEWPORT_MODE.VIEW
var state : CalChart.VIEWPORT_STATE = CalChart.VIEWPORT_STATE.CLEAR

signal viewport_state_change

var smoothness = 0

var target_offset : Vector2 = Vector2.ZERO
var target_zoom : float = 1.0

var current_selection_box = null
var selection_box_reference = preload("res://viewport/2D/scenes/selection_box/selection_box.tscn")

func set_state(new_state : CalChart.VIEWPORT_STATE):
	self.state = new_state
	viewport_state_change.emit(new_state)
	
func clear_state():
	self.state = CalChart.VIEWPORT_STATE.CLEAR
	viewport_state_change.emit(CalChart.VIEWPORT_STATE.CLEAR)

func get_field_position(input_position : Vector2):
	return %Camera.position - ((get_viewport_rect().size / 2) / target_zoom) + (input_position  / target_zoom)

func _input(event):
	
	if(Input.is_action_just_pressed("Zoom In")):
		target_zoom *= 1.05
		
	if(Input.is_action_just_pressed("Zoom Out")):
		target_zoom *= 0.95
		
	if(Input.is_action_just_pressed("Translate")):
		set_state(CalChart.VIEWPORT_STATE.TRANSLATE)
	
	if(Input.is_action_just_released("Translate")):
		clear_state()
		
	if(Input.is_action_just_pressed("Select")):
		set_state(CalChart.VIEWPORT_STATE.SELECT)
		
	if(Input.is_action_just_released("Select")):
		clear_state()
		
	if(event is InputEventMouseButton):
		
		if(Input.is_action_just_pressed("Select")):
			current_selection_box = selection_box_reference.instantiate()
			current_selection_box.set_initial_position(get_field_position(event.position))
			self.add_child(current_selection_box)
			
			set_state(CalChart.VIEWPORT_STATE.SELECT)
			
		if(Input.is_action_just_released("Select")):
			current_selection_box.select_all()
			current_selection_box.queue_free()
			
			clear_state()
	
	# middle-mouse translation
	if(event is InputEventMouseMotion):
		
		if(state == CalChart.VIEWPORT_STATE.SELECT):
			current_selection_box.update(get_field_position(event.position))
		
		if(state == CalChart.VIEWPORT_STATE.TRANSLATE):
			%Camera.position -= event.relative / target_zoom

func _process(delta):
	
	var effective_delta : float = delta / (1.0/ProjectSettings.get_setting("physics/common/physics_ticks_per_second"))
	var effective_smoothness = smoothness if (state == CalChart.VIEWPORT_STATE.TRANSLATE) else 0
	
	%Camera.offset = lerp(%Camera.offset,target_offset,1 - pow(effective_smoothness,effective_delta))
	%Camera.zoom = lerp(%Camera.zoom,Vector2.ONE*target_zoom,1 - pow(effective_smoothness,effective_delta))
