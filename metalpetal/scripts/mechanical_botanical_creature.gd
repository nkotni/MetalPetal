class_name MechanicalBotanicalCreature
extends CharacterBody2D

var creature_name: String
var backstory: String
var health: int
var defense: int
var attack_power: int
var attack_speed:float = 1.5
var special_ability: String
var base_speed:float = 100
var texture:Texture

var _wander_speed_factor  = 0.25
var _target:MechanicalBotanicalCreature
var _attack_timer:Timer
var _attack_outline_timer:Timer
var _attack_outline_duration:float = 0.33
var _special_timer:Timer
var _move_to_target:bool = true
var _attacking_target:bool = false

@onready var _outline_shader:ShaderMaterial = preload("res://assets/outline_material.tres")
#@onready var _sprite:Sprite2D = $Sprite2D

func _ready():
	print(creature_name + " has been created.")
	print("Backstory: " + backstory)
	print("Stats -> Health: " + str(health) + ", Defense: " + str(defense) + ", Attack Power: " + str(attack_power))
	print("Special Ability: " + special_ability)
	add_to_group("metal_petal")
	_target = _find_random_target()
	
	_attack_timer = Timer.new()
	_attack_timer.one_shot = true
	add_child(_attack_timer)
	_attack_timer.start(attack_speed)
	
	_attack_outline_timer = Timer.new()
	_attack_outline_timer.one_shot = true
	add_child(_attack_outline_timer)
	
	global_position = Vector2(randf_range(100, 900), randf_range(100, 900))
	
	#_sprite.material = _outline_shader.duplicate(true)
	#$Sprite2D.material = _outline_shader.
	#$Sprite2D.material = _outline_shader.duplicate(true)
	

func _process(delta) -> void:
	
	if _target == self || _target == null:
		#slow wander
		position += Vector2(randf_range(-1, 1), randf_range(-1, 1)) * base_speed * _wander_speed_factor * delta
		_target = _find_random_target()
	elif _target != null && _move_to_target:
		position += position.direction_to(_target.position) * base_speed * delta
		
	if _attacking_target:
		attack_target()
		
	#if _attack_outline_timer.is_stopped():
		#$Sprite2D.material.set_shader_parameter("thickness", 0)
	#else:
		#$Sprite2D.material.set_shader_parameter("thickness", randf_range(3,7))

func use_special_ability():
	print(creature_name + " uses " + special_ability)

func _find_random_target() -> MechanicalBotanicalCreature:
	if 2 > get_tree().get_nodes_in_group("metal_petal").size():
		return self
		
	var target =  get_tree().get_nodes_in_group("metal_petal").pick_random()
	while target == self:
		target =  get_tree().get_nodes_in_group("metal_petal").pick_random()
	
	_move_to_target = true
	return target as MechanicalBotanicalCreature


func take_damage(incoming_attack_power:int) -> void:
	health -= float(incoming_attack_power) * float(defense) / 100.0
	if health <= 0:
		_die()
	
func attack_target() -> void:
	if _attack_timer.is_stopped():
		_target.take_damage(attack_power)
		_attack_timer.start(attack_speed)
		_attack_outline_timer.start(_attack_outline_duration)

func _die():
	queue_free()

func _on_area_2d_area_entered(area:Area2D):
	var other_area_parent = area.get_parent()
	if other_area_parent == _target:
		_move_to_target = false
		_attacking_target = true


func _on_area_2d_area_exited(area):
	var other_area_parent = area.get_parent()
	if other_area_parent == _target:
		_move_to_target = true
		_attacking_target = false
