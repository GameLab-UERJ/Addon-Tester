extends Control


@onready var color_rect: ColorRect = $ColorRect
@onready var selected_transition_label: Label = $VBoxContainer/SelectedTransitionLabel


func _ready() -> void:
	if LastTransition.key >= 0:
		selected_transition_label.text = EasyTransition.TransitionAnim.find_key(LastTransition.key)
		
	color_rect.color = Color(randf(),randf(),randf(),1.0)


func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"):
		LastTransition.next_not_chosen_transition_key()
		EasyTransition.transition_to_path("uid://cq1no5vp8bs22",1,LastTransition.key,color_rect.color)
