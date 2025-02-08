class_name Enemy
extends Node

var spriteContainer: Sprite2D = null

func load_player(texture: Texture2D, weapon: PackedScene, direction: Vector2):
	spriteContainer.texture = texture
