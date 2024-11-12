class_name MechanicalBotanicalFactory
extends Node

enum CreatureType {
	CLOCKWORK_ROSE,
	IRON_IVY,
	COPPER_BLOOM,
	STEEL_WILLOW,
	BRASS_THORN,
	SILVER_LOTUS,
	GOLDEN_FERN,
	TITAN_OAK,
	BRONZE_LILAC,
	OBSIDIAN_CACTUS
}

var creature_paths = {
	CreatureType.CLOCKWORK_ROSE: "res://scripts/clockwork_rose.gd",
	CreatureType.IRON_IVY: "res://scripts/iron_ivygd",
	CreatureType.COPPER_BLOOM: "res://scripts/coppe.r_bloom.gd",
	CreatureType.STEEL_WILLOW: "res://scripts/steel_willow.gd",
	CreatureType.BRASS_THORN: "res://scenes/brass_thorn.tscn",
	CreatureType.SILVER_LOTUS: "res://scripts/silver_lotus.gd",
	CreatureType.GOLDEN_FERN: "res://scripts/golden_fern.gd",
	CreatureType.TITAN_OAK: "res://scripts/titan_oak.gd",
	CreatureType.BRONZE_LILAC: "res://scenes/bronze_lilac.tscn",
	CreatureType.OBSIDIAN_CACTUS: "res://scripts/obsidian_cactus.gd"
}

var creature_cache = {}

#the "build" function from the factory pattern
func create_creature(creature_type: CreatureType) -> MechanicalBotanicalCreature:
	if creature_type in creature_paths:
		if not creature_cache.has(creature_type):
			creature_cache[creature_type] = load(str(creature_paths[creature_type]))
		
		var creature_instance = (creature_cache[creature_type] as PackedScene).instantiate()
		return creature_instance
	else:
		printerr("Error: Unknown creature type: " + str(creature_type))
		return null
