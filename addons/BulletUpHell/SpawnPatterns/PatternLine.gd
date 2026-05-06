@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons7.png")
extends Pattern
## Spawns bullets in a straigth or broken line.
class_name PatternLine

@export_group("Line")
@export var offset = Vector2()				## Position offset between the bullets
@export var center = 1						## Define a "head" bullet, from which all bullets will spawn behind, with their applied offset. This can be used to spawn bullets in V shape / diagonal line instead of vertical/horizontal lines.
@export var symmetric = true				## If the spawn / shot delay > 0, bullets will not be spawned / shot one by one but 2 by 2, starting from the center bullet. Thus doing a symmetrical effect.
var symmetry_type = Spawning.SYMTYPE.Line

func _init():
	resource_name = "PatternLine"
