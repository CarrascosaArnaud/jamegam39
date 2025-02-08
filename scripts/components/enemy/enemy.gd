class_name Enemy
extends Node

var spriteContainer: Sprite2D = null

func load_player(texture: Texture2D, weapon: PackedScene):
	spriteContainer.texture = texture
