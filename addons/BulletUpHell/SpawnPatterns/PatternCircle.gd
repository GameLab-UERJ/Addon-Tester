@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons6.png")
extends Pattern
## Spawns bullets in circle.
class_name PatternCircle

@export_group("Circle")
@export var radius = 0					## Distance between the bullets and the center of the circle
@export_range(0, 360, 0.001, "suffix:°", "radians_as_degrees") var angle_total:float = 2*PI	## 2 PI rad by default for a full circle. You can reduce it so the bullets will spawn in less than a full circle, like a half circle,...
@export_range(0, 360, 0.001, "suffix:°", "radians_as_degrees") var angle_decal:float = 0	## (TODO replace by pattern rotation ) if angle total < 2 PI rad, rotate the pattern
@export var symmetric:bool = false		## If the spawn / shot delay > 0, bullets will not be spawned / shot one by one but 2 by 2, starting from the center bullet. Thus doing a symmetrical effect.
@export var center:int = 0
@export var symmetry_type = 0


func _init():
	resource_name = "PatternCircle"
