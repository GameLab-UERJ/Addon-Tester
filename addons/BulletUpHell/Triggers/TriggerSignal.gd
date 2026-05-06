@icon("res://addons/BulletUpHell/Sprites/NodeIcons11.png")
extends RichTextEffect
class_name TriggerSignal

@export var sig:String = ""		## Triggers if it matches the first argument of a signal sent to the bullet.

func _init():
	resource_name = "TrigSig"
