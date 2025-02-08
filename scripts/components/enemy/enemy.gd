class_name Enemy
extends Node

var spriteContainer: Sprite2D = null
var top_left
var bottom_right

func _ready() -> void:
	var camera = get_viewport().get_camera_2d()
	var viewport_rect = camera.get_viewport_rect()
	
	top_left = camera.global_position - Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)
	bottom_right = camera.global_position + Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)

func load_player(texture: Texture2D, weapon: PackedScene, direction: Vector2):
	spriteContainer.texture = texture

func _process(delta: float) -> void:
	if (self.global_position.x <= (top_left.x - 50) ||
	self.global_position.y <= (top_left.y - 50) ||
	self.global_position.x >= (bottom_right.x + 50) ||
	self.global_position.y >= (bottom_right.y + 50)):
		queue_free()
