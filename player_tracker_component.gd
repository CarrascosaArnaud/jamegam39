extends Node2D

@onready var spawner = $Spawner

func _ready() -> void:
	spawner.trackedNode = get_parent().get_node("Player")
