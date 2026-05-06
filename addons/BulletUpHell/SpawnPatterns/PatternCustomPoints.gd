@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons16.png")
extends Pattern
## Spawns bullets on the points of a custom shape you draw in the editor canvas.
class_name PatternCustomPoints

@export_group("Custom Points")
enum ANGLE_TYPE{FromTangeant, 	## Angles calculated from the tangent to the point on the curve.
				FromCenter,		## Angles are the angles of the vectors from the center position to the points of the curve.
				Custom			## You have to write the angle for each point in the angle variable.
				}	
var shape:Curve2D
@export var calculate_angles:ANGLE_TYPE = ANGLE_TYPE.FromTangeant	## How the angles with which the bullets are shot will be calculated.
@export var angles:Array = []										## If Calculate Angles is set to Custom, this is where you write the angles of every point. Starting from the one you draw first.
var pos:Array = []
@export var center_pos:Vector2										## Position of the center of your shape. The positions of the points on the curve will be saved relative to that center and not the center of the map. This allows you to draw (= store) the shape anywhere on the map, out of the way of your actual game.
@export var reversed_angle:bool=false								## Will add 180° to all angles. Can be used to make the bullets go inward in the shape instead of outward.
enum SYMTYPE{ClosedShape,Line}
@export var symmetric:bool = true									## If the spawn / shot delay > 0, bullets will not be spawned / shot one by one but 2 by 2, starting from the center bullet. Thus doing a symmetrical effect.
@export var center:int = 0
@export var symmetry_type:SYMTYPE = SYMTYPE.ClosedShape


func _init():
	resource_name = "PatternCustomPoints"
