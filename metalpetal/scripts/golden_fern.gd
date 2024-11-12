class_name GoldenFern
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Golden Fern"
	backstory = "The Golden Fern was designed as a botanical sensor, able to detect shifts in the environment. Its golden fronds are capable of emitting bursts of light to signal others."
	health = 60
	defense = 20
	attack_power = 15
	special_ability = "Blinding Radiance: Emits a flash of light that stuns enemies."
	texture = load("res://assets/portraits/golden fern.webp")
	

func use_special_ability():
	print(creature_name + " emits Blinding Radiance, stunning nearby enemies.")
	# Logic to stun enemies for a brief duration
