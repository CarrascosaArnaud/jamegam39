class_name Enemy
extends Node

@export var a: CollisionObject2D

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
	if (self.position.x <= (top_left.x - 250) ||
	self.position.y <= (top_left.y - 250) ||
	self.position.x >= (bottom_right.x + 250) ||
	self.position.y >= (bottom_right.y + 250)):
		print("Vaisseau hors limite", self.position)
		queue_free()
