extends Node2D

@onready var spawner = $Spawner

func _ready() -> void:
	spawner.trackedNode = get_node("res://scenes/world.tscn").find_child("Player")
