extends Enemy

@onready var path_follow : PathFollow2D = $PathFollow2D
@onready var path : Path2D = $"."

# speed in px per second
@export var speed = 100

func load_player(texture: Texture2D):
	spriteContainer = $PathFollow2D/CharacterBody2D/Sprite
	super(texture)

func _process(delta: float) -> void:
	path_follow.progress += speed * delta;
	if (path_follow.progress_ratio >= 1.0):
		print(path.curve.get_point_position(path.curve.point_count - 1))
		path.position += path.curve.get_point_position(path.curve.point_count - 1)
		path_follow.progress_ratio = 0
