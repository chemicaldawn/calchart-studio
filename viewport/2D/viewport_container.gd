extends SubViewportContainer

func _ready():
	$"Viewport/Viewport 2D".connect("viewport_state_change",_on_state_change)

func _on_state_change(state):
	
	match(state):
		
		CalChart.VIEWPORT_STATE.CLEAR:
			self.mouse_default_cursor_shape = Control.CURSOR_ARROW
		
		CalChart.VIEWPORT_STATE.TRANSLATE:
			self.mouse_default_cursor_shape = Control.CURSOR_MOVE
