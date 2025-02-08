extends Enemy

@onready var path_follow : PathFollow2D = $PathFollow2D
@onready var path : Path2D = $"."

# speed in px per second
@export var speed = 100

var weaponInstance

func load_player(texture: Texture2D, weapon: PackedScene):
	spriteContainer = $PathFollow2D/Sprite
	weaponInstance = weapon.instantiate()
	add_child(weaponInstance)
	super(texture, weapon)

func _process(delta: float) -> void:
	path_follow.progress += speed * delta;
	weaponInstance.position = path_follow.position
	if (path_follow.progress_ratio >= 1.0):
		path.position += path.curve.get_point_position(path.curve.point_count - 1)
		path_follow.progress_ratio = 0
