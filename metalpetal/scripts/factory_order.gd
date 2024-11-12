extends Node

@export var anchor:Node2D

var factory:MechanicalBotanicalFactory

func _init() -> void:
	factory = MechanicalBotanicalFactory.new()
	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#var type:MechanicalBotanicalFactory.CreatureType = factory.CreatureType.values().pick_random()
		#var creature := factory.create_creature(type)
		#display_creature_details(creature)
		#anchor.add_child(creature)
		

func display_creature_details(creature: MechanicalBotanicalCreature):
	print("Name: " + creature.creature_name)
	print("Backstory: " + creature.backstory)
	print("Health: " + str(creature.health))
	print("Defense: " + str(creature.defense))
	print("Attack Power: " + str(creature.attack_power))
	print("Special Ability: " + creature.special_ability)
	print("---------------------------------")
