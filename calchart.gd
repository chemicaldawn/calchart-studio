extends Node

enum VIEWPORT_MODE {
	VIEW,
	EDIT
}

enum VIEWPORT_STATE {
	CLEAR = -1,
	SELECT,
	TRANSLATE
}

enum POINT_STATE {
	DESELECTED,
	SELECTED
}

var show : Show

func _ready():
	var balls = ForwardMarchContinuity.new()
	print(balls.as_abbreviated_text())
