extends Resource

class_name Continuity

enum DirectionScheme {
	Directionless = -1,
	Cardinal,
	Any
}

class Direction:
	
	static var North = Direction.new("North","N")
	static var South = Direction.new("South","S")
	static var East = Direction.new("East","E")
	static var West = Direction.new("West","W")
	
	static var EastWestNorthSouth = Direction.new("East/West then North/South to next Stunt Sheet","E/W N/S to next SS",false)
	static var NorthSouthEastWest = Direction.new("North/South then East/West to next Stunt Sheet","N/S E/W to next SS",false)
		
	var name = "Direction"
	var abbreviation = "DIR"
	var cardinal = true
	
	func _init(name : String, abbreviation : String, cardinal : bool = true):
		
		self.name = name
		self.abbreviation = abbreviation
		self.cardinal = cardinal

# Meant to be manipulated during runtime
var length : int = 4
var direction : Direction = Direction.East

# Meant to be overridden.
func get_type():
	return "Continuity"

# Meant to be overridden.
func get_direction_scheme():
	return DirectionScheme.Directionless

# Meant to be overridden.
func get_movement(initial_position : Vector2, progress : float):
	return initial_position

# Meant to be overridden.
func as_text():
	return "Default Continuity"
	
# Meant to be overridden.
func as_abbreviated_text():
	return "DC"
	
func _to_string():
	return as_text()
	
