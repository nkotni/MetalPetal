class_name ObsidianCactus
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Obsidian Cactus"
	backstory = "The Obsidian Cactus is a rare creation with jet-black spines. It can absorb heat and release it in bursts to deter predators."
	health = 70
	defense = 35
	attack_power = 35
	special_ability = "Heat Burst: Releases a wave of heat that burns nearby enemies."
	texture = load("res://assets/portraits/obsidian cactus.webp")

func use_special_ability():
	print(creature_name + " unleashes Heat Burst, burning nearby enemies.")
	# Logic to deal burn damage to enemies
