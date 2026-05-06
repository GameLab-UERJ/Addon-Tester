@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons17.png")
extends Pattern
## Spawns bullets randomly inside the limits of a custom polygon you draw in 
## the editor canvas. 
## [br][br]
## 💡 *IMPORTANT : this pattern requires you to draw a shape in the editor. The “curve” property of the SpawnPattern node will be saved into this resource in order to spawn the bullets on the points you drew.*
## [br][br]
## 💡 *You don’t have to close the polygon, meaning you can draw a square with just 3 lines and the last one will just be assumed to exist.*
class_name PatternCustomArea

@export_group("Custom Area")
var polygon:PackedVector2Array						## Polygon representing the area.
var pos:Array = []
@export var center_pos:Vector2						## Position of the center of your shape. The positions of the points on the curve will be saved relative to that center and not the center of the map. This allows you to draw (= store) the shape anywhere on the map, out of the way of your actual game.

var limit_rect = Rect2(99999,99999,-99999,-99999)
@export var tries_max:int = 5						##  When bullets are spawned at random positions inside the area, the code tries random positions, in the limits of the orange rectangle around your shape, and then checks if it’s inside the polygon. It technically can result in an endless loop. For some shapes more than others. This property allows you to control the maximum amount of trials until the code gives up on searching for a valid position.
@export var pooling:int = 10						## Choosing random positions as explained above takes a lot of resources. For the sake of optimisation, this will only be done when the game loads for the 1th time. A set of different positions are registered and random ones will be picked each time a bullet spawns. This pre-determined set has a size of Nbr of bullets multiplied by Pooling.
@export var grid_spawning:Vector2 = Vector2(0,0)	## Bullets will spawn in a grid like pattern instead of randomly. Imagine a grid where x and y are the spacing between the vertical and horizontal lines, the bullets would spawn on the intersections. [br] - Disable by setting to (0,0)


func _init():
	resource_name = "PatternCustomArea"
