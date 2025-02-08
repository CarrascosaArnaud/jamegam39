extends Node2D

@export var patterns: Array[PackedScene]
@export var textures: Array[Texture2D]

func _ready() -> void:
	generate_random_enemy()

func generate_random_enemy():	
	var rng = RandomNumberGenerator.new()
	var pattern = patterns[rng.randi_range(0, patterns.size() - 1)].instantiate() as Enemy
	var indexTexture = rng.randi_range(0, textures.size() - 1)
	print(indexTexture)
	pattern.load_player(textures[indexTexture])
	add_child(pattern)

func get_all_tscn_from_folder_path(path: String, extensions: Array = []) -> Array[String]:
	var tscns: Array[String] = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			if !dir.current_is_dir() && extensions.any(func(extension): return extension == file_name.get_extension()):
				var full_path = path.path_join(file_name)
				tscns.append(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		return []
	return tscns
