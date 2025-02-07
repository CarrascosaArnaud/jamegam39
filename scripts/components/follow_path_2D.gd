extends Node

@onready var path_follow : PathFollow2D = $PathFollow2D
@onready var path : Path2D = $"."
@onready var transform : Node2D = $"."
@onready var spriteContainer : Sprite2D = $PathFollow2D/Sprite2D

@export var texture : Texture2D
# speed in px per second
@export var speed = 100

func _ready() -> void:
	spriteContainer.texture = texture;

func _process(delta: float) -> void:
	path_follow.progress += speed * delta;
	if (path_follow.progress_ratio >= 1.0):
		path_follow.progress_ratio = 0;
		transform.position = path.to_global(path.curve.get_point_position(path.curve.point_count - 1));
