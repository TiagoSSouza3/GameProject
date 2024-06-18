extends Control

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("main_menu_button"):
		button.connect("pressed", Callable(self, "on_button_pressed").bind(button.name))
		button.connect("mouse_exited", Callable(self, "mouse_interaction").bind(button, "exited"))
		button.connect("mouse_entered", Callable(self, "mouse_interaction").bind(button, "entered"))
		
func on_button_pressed(_button_name: String) -> void:
	get_tree().change_scene_to_file("res://Scenes/management/open_world.tscn")
		
func mouse_interaction(button: Button, type: String) -> void:
	match type:
		"entered":
			button.modulate.a = 0.8
		"exited":
			button.modulate.a = 1.0
