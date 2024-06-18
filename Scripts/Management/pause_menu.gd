extends Control

@onready var animation: AnimationPlayer = get_node("Animation")

var is_visible_now: bool = false

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", Callable(self, "on_button_pressed").bind(button.name))
		button.connect("mouse_entered", Callable(self, "mouse_interaction").bind(button, "entered"))
		button.connect("mouse_exited", Callable(self, "mouse_interaction").bind(button, "exited"))
		
func play_animation(anim_name: String) -> void:
	animation.play(anim_name)
		
func mouse_interaction(button: Button, type: String) -> void:
	match type:
		"entered":
			button.modulate.a = 0.8
		"exited":
			button.modulate.a = 1.0
			
func on_button_pressed(button_name: String) -> void:
	match button_name:
		"Continue":
			play_animation("hide_container")
			
		"Exit":
			get_tree().change_scene_to_file("res://Scenes/management/main_menu.tscn")
			pass

func on_animation_finished(anim_name):
	match anim_name:
		"hide_container":
			is_visible_now = false
