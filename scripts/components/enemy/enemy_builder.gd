extends Node2D

@export var patterns: Array[PackedScene]
@export var textures: Array[Texture2D]

func _ready() -> void:
	generate_random_enemy(Vector2(500, 300))

func generate_random_enemy(position: Vector2 = self.position):
	var rng = RandomNumberGenerator.new()
	var pattern = patterns[rng.randi_range(0, patterns.size() - 1)].instantiate() as Enemy
	var indexTexture = rng.randi_range(0, textures.size() - 1)
	pattern.load_player(textures[indexTexture])
	pattern.position = position
	add_child(pattern)
