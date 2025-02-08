extends ShootingPattern

func _ready() -> void:
	get_children()[0].trackedNode = get_tree().current_scene.find_child("Player")
