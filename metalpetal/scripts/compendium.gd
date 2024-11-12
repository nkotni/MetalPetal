class_name Compendium
extends Node2D

@export var world:Node2D

var factory:MechanicalBotanicalFactory

var creature_pages = {
	MechanicalBotanicalFactory.CreatureType.CLOCKWORK_ROSE: "res://assets/portraits/clockwork rose.webp",
	MechanicalBotanicalFactory.CreatureType.IRON_IVY: "res://assets/portraits/iron ivy.webp",
	MechanicalBotanicalFactory.CreatureType.COPPER_BLOOM: "res://assets/portraits/copper bloom.webp",
	MechanicalBotanicalFactory.CreatureType.STEEL_WILLOW: "res://assets/portraits/steel willow.webp",
	MechanicalBotanicalFactory.CreatureType.BRASS_THORN: "res://assets/portraits/brass thorn.webp",
	MechanicalBotanicalFactory.CreatureType.SILVER_LOTUS: "res://assets/portraits/silver lotus.webp",
	MechanicalBotanicalFactory.CreatureType.GOLDEN_FERN: "res://assets/portraits/golden fern.webp",
	MechanicalBotanicalFactory.CreatureType.TITAN_OAK: "res://assets/portraits/titan oak.webp",
	MechanicalBotanicalFactory.CreatureType.BRONZE_LILAC: "res://assets/portraits/bronze lilac.webp",
	MechanicalBotanicalFactory.CreatureType.OBSIDIAN_CACTUS: "res://assets/portraits/obsidian cactus.webp"
}

var _current_page_type:MechanicalBotanicalFactory.CreatureType




func _ready():
	factory = MechanicalBotanicalFactory.new()
	_current_page_type = MechanicalBotanicalFactory.CreatureType.values().pick_random()
	_load_page()
	

func _load_page() -> void:
	$Page.texture = load(creature_pages[_current_page_type])


func _on_left_button_pressed():
	_current_page_type = wrapi(_current_page_type - 1, 0, MechanicalBotanicalFactory.CreatureType.size())
	_load_page()


func _on_right_button_pressed():
	_current_page_type = wrapi(_current_page_type + 1, 0, MechanicalBotanicalFactory.CreatureType.size())
	_load_page()


func _on_create_button_pressed():
	world.add_child(factory.create_creature(_current_page_type))
	visible = false
