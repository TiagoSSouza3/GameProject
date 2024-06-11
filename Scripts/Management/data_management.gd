extends Node
class_name DataManagement

var save_path: String = "user://save.dat"
var spawn_position: Vector2

var data_dictionary: Dictionary = {
	"player_texture": "",
	"player_position": spawn_position,
	"player_stats": []
}

func set_spawn_position(position: Vector2) -> void:
	spawn_position = position

func save_data() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_var(data_dictionary)
		file.close()
		
func load_data() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		data_dictionary = file.get_var()
		file.close()
