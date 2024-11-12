extends Label

@onready var obs:MechanicalBotanicalCreature = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if obs != null && obs._target != null:
		text = obs.name
		text += "\n" + obs._target.name
		text += "\n" + str(obs.health)
		text += "\n t:" + str(obs.position.round())
		text += "\n" + str(obs._move_to_target)
		if obs._target == obs:
			text += "\n STUCK ON SELF" 
		if !is_zero_approx(obs._attack_timer.time_left) :
			text += "\n t:" + str(snapped(obs._attack_timer.time_left, 0.01))
