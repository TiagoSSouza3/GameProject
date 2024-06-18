extends CanvasLayer

@onready var pause_menu: Control = get_node("PauseMenu")

func _ready() -> void:
	pause_menu.set_visible(false)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("Pause"):
		
		pause_menu.is_visible_now = !pause_menu.is_visible_now
		
		if pause_menu.is_visible_now:
			pause_menu.play_animation("show_container")
		else:
			pause_menu.play_animation("hide_container")
