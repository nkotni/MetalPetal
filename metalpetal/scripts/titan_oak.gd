class_name TitanOak
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Titan Oak"
	backstory = "A colossal mechanical tree whose roots are embedded with gears and steam vents. It was created to guard the deepest forests and defend them from threats."
	health = 200
	defense = 80
	attack_power = 50
	special_ability = "Earthquake Slam: Stomps the ground to create a shockwave that damages all enemies."
	texture = load("res://assets/portraits/titan oak.webp")
	

func use_special_ability():
	print(creature_name + " performs Earthquake Slam, sending a shockwave that damages all enemies.")
	# Logic to deal AoE damage to all enemies
