extends Node2D

func _ready() -> void:
	$"Spawner".trackedNode = get_tree().current_scene.find_child("Player")
