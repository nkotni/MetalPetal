class_name IronIvy
extends MechanicalBotanicalCreature

func _init():
	creature_name = "Iron Ivy"
	backstory = "Iron Ivy was designed to mimic the growth of real ivy but reinforced with metallic leaves and hydraulic tendrils. It was initially created to reclaim abandoned cities by wrapping around structures and purifying the air."
	health = 80
	defense = 50
	attack_power = 20
	special_ability = "Entangle: Wraps foes in metallic vines, immobilizing them temporarily."
	texture = load("res://assets/portraits/iron ivy.webp")
	

func use_special_ability():
	print(creature_name + " uses Entangle, immobilizing foes with metallic vines.")
	# Logic to immobilize enemies for a few seconds
