@icon("res://addons/BulletUpHell/Sprites/NodeIcons13.png")
extends RichTextEffect
class_name TriggerCollision

@export var group_to_collide:String = "" 	## name of a group of colliders. left empty for all
@export var target_to_collide:NodePath		## target to collide instead of a group
@export var on_bounce = false				## if a bounce can trigger or just a standard collision.

var node_collide:Node2D

func _init():
	resource_name = "TrigCol"
