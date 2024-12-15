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
	CreatureType.CLOCKWORK_ROSE: "res://scenes/clockwork_rose.gd",
	CreatureType.IRON_IVY: "res://scenes/iron_ivy.tscn",
	CreatureType.COPPER_BLOOM: "res://scenes/coppe.r_bloom.tscn",
	CreatureType.STEEL_WILLOW: "res://scenes/steel_willow.tscn",
	CreatureType.BRASS_THORN: "res://scenes/brass_thorn.tscn",
	CreatureType.SILVER_LOTUS: "res://scenes/silver_lotus.tscn",
	CreatureType.GOLDEN_FERN: "res://scenes/golden_fern.tscn",
	CreatureType.TITAN_OAK: "res://scenes/titan_oak.tscn",
	CreatureType.BRONZE_LILAC: "res://scenes/bronze_lilac.tscn",
	CreatureType.OBSIDIAN_CACTUS: "res://scenes/obsidian_cactus.tscn"
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
