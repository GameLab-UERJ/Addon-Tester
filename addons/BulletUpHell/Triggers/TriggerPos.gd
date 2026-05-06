@icon("res://addons/BulletUpHell/Sprites/NodeIcons12.png")
extends RichTextEffect
class_name TriggerPos

enum AXIS { X, 		## Only x axis
			Y,  	## Only y axis
			BOTH	## both axis
		}
@export var on_axis:AXIS = AXIS.BOTH	## define which axis will be checked by the trigger.
@export var pos:Vector2					## position the bullet has to reach. If only one axis is checked, the other will be ignored.
@export var target:NodePath				## using a node instead of a position.
@export var distance:float = 10			## distance between the bullet and the targeted position/node. [br][br]Warnings : high speed bullets might not register they reached the position if distance is too low. Don't be afraid to adjust it if needed. ± 5 pixels per 100 units of speed.

var node_target:Node2D

func _init():
	resource_name = "TrigPos"
