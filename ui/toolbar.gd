extends PanelContainer

signal show_windows

func _ready():
	%File.get_popup().connect("index_pressed",_on_file_option_selected)
	
func _on_file_option_selected(index : int):
	
	var option = %File.get_popup().get_item_text(index)
	
	match(option):
		"New":
			show_windows.emit()
