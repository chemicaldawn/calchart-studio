extends VBoxContainer

var tick_reference = preload("tick.tscn")

var range = 20
var small_tick_spacing = 1
var large_tick_spacing = 4
var length = 24

func get_beat_length():
	return (%"Timeline Base".size.x / float(range))
	
func get_position_from_beat(beat):
	return (get_beat_length() * beat)

func reposition_timeline_background():
	%"Timeline Base".position.x = -get_beat_length() * %Scrollbar.value

func update_scrollbar():
	%Scrollbar.min_value = 0
	%Scrollbar.max_value = length
	%Scrollbar.page = range

func render_timeline_background():
	
	for tick in get_tree().get_nodes_in_group("Ticks"):
		tick.queue_free()
	
	# render large ticks
	var index = 0
	while (index < length):
		
		var tick = tick_reference.instantiate()
		
		tick.position.x = get_timeline_coordinate(index)
		tick.size.y = %"Timeline Base".size.y
		tick.get_node("Label").text = str(index)
		
		tick.add_to_group("Ticks")
		%"Timeline Base".add_child(tick)
		
		index += large_tick_spacing
		
	#render small ticks
	index = small_tick_spacing
	while (index < length):
		
		var tick = tick_reference.instantiate()
		tick.position.x = get_timeline_coordinate(index)
		tick.size.y = 30
		tick.get_node("Label").visible = false
		
		tick.add_to_group("Ticks")
		%"Timeline Base".add_child(tick)
		
		index += small_tick_spacing
	
func get_timeline_coordinate(internal_coordinate):
	var ratio : float = float(internal_coordinate) / float(range)
	return %"Timeline Base".size.x * ratio

func _on_timeline_base_resized():
	reposition_timeline_background()
	update_scrollbar()
	render_timeline_background()

func _on_scrollbar_value_changed(value):
	reposition_timeline_background()
