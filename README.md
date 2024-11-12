# MetalPetal
This is a project to serve as a game-based example of the Factory Pattern. It works in the context of the MetalPetal Godot project where mechanical botanical creatures thrive. Think of it as an organized, structured way to manage the creation of different types of creatures without cluttering up your main code. Instead of directly creating each creature with specific details in the main script, the Factory Pattern lets us handle object creation in a single, centralized class. This way, the code is neater, easier to update, and more flexible for future additions. Using the Factory Pattern in this project keeps our game logic flexible, organized, and easy to expand—a useful approach for any game that requires managing multiple types of objects.

### Understanding the Factory Pattern

The Factory Pattern is a creational design pattern. It’s essentially a strategy to delegate or “outsource” the process of creating objects to a factory class. Instead of hardcoding every creature type throughout the project, we create them through this one factory class. 

By using a factory, we achieve a few key things:
1. **Encapsulation**: All the creation logic is grouped in one place (the factory), making it easier to manage and update.
2. **Flexibility**: If we want to add a new type of creature, we only need to adjust the factory slightly. There’s no need to update the main game logic, which makes the code much easier to extend.
3. **Reduced Dependence**: The factory creates the creatures based on input parameters (e.g., a type code), so the main game code doesn’t need to know the details of each creature. This makes our code more modular and less prone to errors.

### Applying the Factory Pattern to Our Mechanical Botanical Creatures

In our project, each creature—like the *Clockwork Rose*, *Iron Ivy*, or *Brass Thorn*—has unique properties and abilities. To avoid repetitive and cluttered code, we use a factory to handle creating these creatures. Here’s how we set it up:

#### Step 1: Create a Base Class for Creatures

The first step is to define a base class, `MechanicalBotanicalCreature`, which has shared properties like `creature_name`, `health`, `defense`, and more. This base class acts as a template for all the specific creature types:

```gdscript
# MechanicalBotanicalCreature.gd
extends Node2D
class_name MechanicalBotanicalCreature

var creature_name: String
var backstory: String
var health: int
var defense: int
var attack_power: int
var special_ability: String

func _ready():
    print(creature_name + " has been created.")
    print("Backstory: " + backstory)
```

#### Step 2: Create Specific Creature Scripts

Next, we create individual scripts for each creature. Each script inherits from `MechanicalBotanicalCreature`, allowing it to define its own properties and special abilities. Here’s an example for *Clockwork Rose*:

```gdscript
# clockwork_rose.gd
class_name ClockworkRose
extends MechanicalBotanicalCreature


func _ready():
    creature_name = "Clockwork Rose"
    backstory = "A delicate creation forged from gears and petals..."
    health = 60
    defense = 30
    attack_power = 15
    special_ability = "Petal Burst: Releases a shower of sharp petals."
```

This setup is repeated for each creature type—**Iron Ivy**, **Brass Thorn**, and others.

#### Step 3: Implement the Factory Class

The `MechanicalBotanicalFactory` class is where the magic happens. This class knows how to create each type of creature based on an input parameter. It contains a dictionary that maps each creature type to its script file path, allowing it to create instances of the creatures on demand:

```gdscript
# MechanicalBotanicalFactory.gd
extends Node
class_name MechanicalBotanicalFactory

enum CreatureType {
    CLOCKWORK_ROSE,
    IRON_IVY,
    BRASS_THORN,
    # ...other creatures
}

var creature_paths: Dictionary[int, String] = {
    CreatureType.CLOCKWORK_ROSE: "res://scripts/ClockworkRose.gd",
    CreatureType.IRON_IVY: "res://scripts/IronIvy.gd",
    CreatureType.BRASS_THORN: "res://scripts/BrassThorn.gd"
    # ...other paths
}

var creature_cache = {}

func create_creature(creature_type: int) -> MechanicalBotanicalCreature:
    if creature_type in creature_paths:
        if not creature_cache.has(creature_type):
            creature_cache[creature_type] = preload(creature_paths[creature_type]) as PackedScene
        
        var creature_instance: MechanicalBotanicalCreature = creature_cache[creature_type].instance() as MechanicalBotanicalCreature
        return creature_instance
    else:
        printerr("Error: Unknown creature type: " + str(creature_type))
        return null
```

This factory can now create any creature simply by passing the type code (e.g., `CreatureType.CLOCKWORK_ROSE`).

#### Step 4: Use the Factory in the Main Game Code

In the main game code, we now use the factory to generate creatures. Instead of hardcoding the creation of each creature, we call `create_creature` on the factory and let it do the work:

```gdscript
# Main.gd
extends Node2D

onready var factory: MechanicalBotanicalFactory = MechanicalBotanicalFactory.new()

func _ready():
    # Create a Clockwork Rose
    var clockwork_rose = factory.create_creature(MechanicalBotanicalFactory.CreatureType.CLOCKWORK_ROSE)
    if clockwork_rose:
        add_child(clockwork_rose)
        clockwork_rose.position = Vector2(100, 100)

    # Create an Iron Ivy
    var iron_ivy = factory.create_creature(MechanicalBotanicalFactory.CreatureType.IRON_IVY)
    if iron_ivy:
        add_child(iron_ivy)
        iron_ivy.position = Vector2(200, 200)
```

With this setup, adding a new creature type is simple: just create a new creature script, add it to the `creature_paths` dictionary in the factory, and the main game logic remains untouched.



