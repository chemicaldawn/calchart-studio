extends VariableStepContinuity

class_name ForwardMarchContinuity

func get_type():
	return "Forward March"

func get_direction_scheme():
	return Continuity.DirectionScheme.Any

func as_text():
	return self.get_type() + " " + self.step_type.name + " " + str(self.length) + " " + self.direction.name

func as_abbreviated_text():
	return "FM" + self.step_type.abbreviation + " " + str(self.length) + self.direction.abbreviation
