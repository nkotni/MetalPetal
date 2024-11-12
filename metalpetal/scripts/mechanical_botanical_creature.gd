class_name MechanicalBotanicalCreature
extends Sprite2D

var creature_name: String
var backstory: String
var health: int
var defense: int
var attack_power: int
var special_ability: String

func _ready():
	print(creature_name + " has been created.")
	print("Backstory: " + backstory)
	print("Stats -> Health: " + str(health) + ", Defense: " + str(defense) + ", Attack Power: " + str(attack_power))
	print("Special Ability: " + special_ability)


func use_special_ability():
	print(creature_name + " uses " + special_ability)
