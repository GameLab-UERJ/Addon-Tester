extends Node
## If you want to spawn scenes instead of default bullets, put the scene as a child of this node, 
## change the properties you want and InstanceLister will make it possible to spawn instances of 
## it, with the correct properties.
class_name InstanceLister


func _ready():
	for node in get_children():
		if node is Node2D:
			remove_child(node)
			Spawning.new_instance(node.name, node)
		else:
			push_warning("Children of InstanceLister are deleted upon game start. Node "\
						+ String(node.get_path()) + " isn't a 2D node so it can't be used for spawning.")
	queue_free()
