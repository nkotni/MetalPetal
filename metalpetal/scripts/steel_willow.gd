class_name SteelWillow
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Steel Willow"
	backstory = "The Steel Willow is a towering tree with branches that sway as if alive, each segment constructed from flexible alloys. It is said to guard sacred gardens, providing mechanical wisdom to those who listen."
	health = 150
	defense = 60
	attack_power = 25
	special_ability = "Iron Wall: Temporarily increases its defense to block incoming attacks."
	texture = load("res://assets/portraits/steel willow.webp")

func use_special_ability():
	print(creature_name + " raises its defense with Iron Wall, blocking incoming attacks.")
	# Logic to temporarily increase defense
