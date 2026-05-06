@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons18.png")
extends PackedDataContainer
## Properties of Objects 
class_name ObjectProps

@export var instance_id:String				## [ID]  : name of the node you want to spawn 
@export var fixed_rotation:bool = true		## if true, the @Spawn Pattern Resource  properties can't affect the node's rotation, which will stay the same.
@export var angle:float
@export var groups:PackedStringArray = []	## list of groups that will be assigned to the node
@export var overwrite_groups:bool = false	## if true, remove the groups already assigned to the node before adding the new ones

@export_group("Triggers")
@export var trigger_container:String
@export var trigger_wait_for_shot = true
#@export var r_trigger_choice:String

var node_container:Node2D
