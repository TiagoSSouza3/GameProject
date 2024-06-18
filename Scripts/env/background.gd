extends ParallaxBackground
class_name background

@export var process: bool

func _ready():
	if process == false:
		set_physics_process(false)
