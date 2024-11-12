class_name CopperBloom
extends MechanicalBotanicalCreature




func _init():
	creature_name = "Copper Bloom"
	backstory = "Copper Bloom is a flower-like automaton with rotating petals that absorb sunlight and convert it into energy. Created by an ancient civilization, it was meant to be a perpetual energy source."
	health = 70
	defense = 25
	attack_power = 10
	special_ability = "Solar Surge: Absorbs sunlight to heal itself over time."
	texture = load("res://assets/portraits/copper bloom.webp")
	
	
func use_special_ability():
	print(creature_name + " activates Solar Surge, absorbing sunlight to heal itself over time.")
	# Logic to increase health gradually over a period
