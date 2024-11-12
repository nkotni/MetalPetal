class_name ClockworkRose
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Clockwork Rose"
	backstory = "A delicate creation forged from gears and petals, the Clockwork Rose was built to symbolize the unity of nature and machinery. Its soft whirring soothes those who hear it."
	health = 60
	defense = 30
	attack_power = 15
	special_ability = "Petal Burst: Releases a shower of sharp petals to damage nearby foes."
	texture = load("res://assets/portraits/clockwork rose.webp")
	
	
func use_special_ability():
	print(name + " releases a burst of sharp petals, dealing damage to all nearby enemies.")
	# Example damage logic for nearby foes
