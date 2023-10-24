extends Control

var default_theme = preload("main.tres")

func adapt(scale : float):
	theme.set_font_size("font_size","Label",scale * 16)

func _on_item_rect_changed():
	var scale = size.x/1920.0
	
	#adapt(scale)
