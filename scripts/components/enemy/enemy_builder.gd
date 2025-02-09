extends Node2D

@export var patterns: Array[PackedScene]
@export var weapons: Array[PackedScene]
@export var textures: Array[Texture2D]

func _ready() -> void:
	generate_random_enemy() # <= A commenté si vous lancer depuis la scene Main
	#pass

func generate_random_enemy():
	var screenSize = get_viewport_rect().size
	var side = randi_range(0,3)
	var rng = RandomNumberGenerator.new()
	var pattern = patterns[rng.randi_range(0, patterns.size() - 1)].instantiate() as Enemy
	var texture = textures[rng.randi_range(0, textures.size() - 1)]
	var weapon = weapons[rng.randi_range(0, weapons.size() - 1)]
	match side:
		0:  # Haut
			pattern.global_position = Vector2(randi_range(0, screenSize.x), -50)
		1:  # Bas
			pattern.global_position = Vector2(randi_range(0, screenSize.x), screenSize.y + 50)
		2:  # Gauche
			pattern.global_position = Vector2(-50, randi_range(0, screenSize.y))
		3:  # Droite
			pattern.global_position = Vector2(screenSize.x + 50, randi_range(0, screenSize.y))
	var player = get_tree().current_scene.find_child("Player")
	var direction = pattern.global_position.direction_to(player.global_position)
	pattern.load_player(texture, weapon, direction)
	add_child(pattern)
