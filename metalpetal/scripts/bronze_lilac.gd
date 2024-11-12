class_name BronzeLilac
extends MechanicalBotanicalCreature

func _ready():
	super._ready()

func _process(_delta):
	super._process(_delta)

func _init():
	creature_name = "Bronze Lilac"
	backstory = "The Bronze Lilac is known for its subtle, enchanting fragrance that can soothe or confuse its targets. Built as a guardian for royal gardens, it emanates an aura of tranquility."
	health = 90
	defense = 30
	attack_power = 20
	special_ability = "Aromatic Veil: Releases a scent that confuses and disorients foes."
	texture = load("res://assets/portraits/bronze lilac.webp")
	

func use_special_ability():
	print(creature_name + " releases Aromatic Veil, confusing and disorienting nearby foes.")
	# Logic to apply confusion to enemies
