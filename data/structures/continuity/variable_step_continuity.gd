extends Continuity

class_name VariableStepContinuity

class Step:
	
	static var HighStep : Step = Step.new("High Step", "HS", 1)
	
	var name = "Step"
	var abbreviation = "S"
	var beats_per_step = 1
	
	func _init(name : String, abbreviation : String, beats_per_step : int):
		self.name = name
		self.abbreviation = abbreviation
		self.beats_per_step = beats_per_step

var step_type : Step = Step.HighStep

func get_type():
	return "Variable Step"
