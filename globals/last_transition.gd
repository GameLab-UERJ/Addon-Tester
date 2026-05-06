extends Node

var key : int = -1
var not_chosen : Array = []


func next_not_chosen_transition_key() -> void:
	if not_chosen.is_empty():
		not_chosen = range(len(EasyTransition.TransitionAnim))
	key = not_chosen.pop_at(randi_range(0,len(not_chosen)-1))
