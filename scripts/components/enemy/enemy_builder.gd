extends Node2D

@export var patterns: Array[PackedScene]
@export var weapons: Array[PackedScene]
@export var textures: Array[Texture2D]

func _ready() -> void:
	generate_random_enemy(Vector2(1500, 500))

func generate_random_enemy(position: Vector2 = self.position):
	var rng = RandomNumberGenerator.new()
	var pattern = patterns[rng.randi_range(0, patterns.size() - 1)].instantiate() as Enemy
	var texture = textures[rng.randi_range(0, textures.size() - 1)]
	var weapon = weapons[rng.randi_range(0, weapons.size() - 1)]
	pattern.position = position
	var player = get_tree().current_scene.find_child("Player")
	var direction = position.direction_to(player.position)
	pattern.load_player(texture, weapon, direction)
	add_child(pattern)
