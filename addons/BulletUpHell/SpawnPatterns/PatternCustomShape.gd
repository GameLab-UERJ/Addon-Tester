@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons9.png")
extends Pattern
## Spawns bullets on the lines of a custom shape you draw in the editor canvas. [br][br]
## 💡 *IMPORTANT : this pattern requires you to draw a shape in the editor. The “curve” property of the SpawnPattern node will be saved into this resource in order to spawn the bullets on the shape you drew.*
class_name PatternCustomShape

var shape:Curve2D
var angles:Array = []
var pos:Array = []

@export_group("Custom Shape")
@export var closed_shape = false					## If your custom shape is a closed shape or not. Prevents the first and last bullet to spawn at the sale position.
@export var center_pos:Vector2						## Position of the center of your shape. The positions of the points on the curve will be saved relative to that center and not the center of the map. This allows you to draw (= store) the shape anywhere on the map, out of the way of your actual game.
@export var symmetric:bool = true					## If the spawn / shot delay > 0, bullets will not be spawned / shot one by one but 2 by 2, starting from the center bullet. Thus doing a symmetrical effect.
@export var center:int = 0
@export var symmetry_type = Spawning.SYMTYPE.Line


func _init():
	resource_name = "PatternCustomShape"
