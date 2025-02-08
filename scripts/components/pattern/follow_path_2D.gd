extends Enemy

@onready var path_follow : PathFollow2D = $PathFollow2D
@onready var path : Path2D = $"."

# speed in px per second
@export var speed = 100

var weaponInstance

func load_player(texture: Texture2D, weapon: PackedScene, direction: Vector2):
	spriteContainer = $PathFollow2D/Sprite
	weaponInstance = weapon.instantiate()
	add_child(weaponInstance)
	self.rotation = atan2(-direction.x, direction.y)
	weaponInstance.rotation = -self.rotation
	super(texture, weapon, direction)

func _process(delta: float) -> void:
	super(delta)
	path_follow.progress += speed * delta;
	weaponInstance.position = path_follow.position
	if (path_follow.progress_ratio >= 1.0):
		path.global_position = path_follow.global_position
		path_follow.progress_ratio = 0
