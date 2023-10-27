extends Control

var default_theme = preload("main.tres")

var base_ui_scale = 1
@export
var universal_ui_scale = 1

var toolbars = []
var headers = []
@export
var default_toolbar_size : int = 40
@export
var default_header_size : int = 30
@export
var default_font_size : int = 16

func _ready():
	base_ui_scale = float(DisplayServer.screen_get_size(0).x) / float(ProjectSettings.get("display/window/size/viewport_width"))
	
	toolbars = get_tree().get_nodes_in_group("Toolbar")
	headers = get_tree().get_nodes_in_group("Header")
	
	adapt(base_ui_scale)

func adapt(scale : float):
	
	scale *= universal_ui_scale
	
	for toolbar in toolbars:
		toolbar.custom_minimum_size.y = default_toolbar_size * scale
		
	for header in headers:
		header.custom_minimum_size.y = default_header_size * scale
	
	theme.set_font_size("font_size","Label",scale * default_font_size)
	theme.set_font_size("font_size","MenuButton",scale * default_font_size)
	theme.set_font_size("font_size","PopupMenu",scale * default_font_size)
