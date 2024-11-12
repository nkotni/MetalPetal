class_name BrassThorn
extends MechanicalBotanicalCreature


func _ready():
	super._ready()

func _process(delta) -> void:
	super._process(delta)

func _init():
	creature_name = "Brass Thorn"
	backstory = "This small, spiny bush was developed as a defense mechanism, its thorns containing retractable needles filled with an oil-based tranquilizer. It was used to protect rare plants in automated gardens."
	health = 50
	defense = 40
	attack_power = 30
	special_ability = "Thorn Barrage: Fires tranquilizer-coated thorns at its enemies."
	texture = load("res://assets/portraits/brass thorn.webp")


func use_special_ability():
	print(creature_name + " fires a barrage of tranquilizer-coated thorns at its enemies.")
	# Logic to deal damage and possibly apply a status effect to enemies
