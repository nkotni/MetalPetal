class_name SilverLotus
extends MechanicalBotanicalCreature


func _init():
	creature_name = "Silver Lotus"
	backstory = "The Silver Lotus was created for meditative purposes, with petals that emit a soft, silver glow and resonate with a calming hum. Legends say it could connect with a person’s mind and share peaceful visions."
	health = 100
	defense = 20
	attack_power = 10
	special_ability = "Mind Meld: Temporarily pacifies nearby creatures, preventing them from attacking."
	texture = load("res://assets/portraits/silver lotus.webp")
	
	
func use_special_ability():
	print(creature_name + " uses Mind Meld, pacifying nearby creatures and preventing them from attacking.")
	# Logic to apply a status effect that pacifies nearby enemies
