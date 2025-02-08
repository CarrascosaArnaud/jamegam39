extends Enemy

@export var speed = 100
@export var direction : Vector2 = Vector2(0, 1)
@export var follow_rotation : bool = true

var top_left
var bottom_right
var state_bounce_x = null
var state_bounce_y = null

func _ready() -> void:
	var camera = get_viewport().get_camera_2d()
	var viewport_rect = camera.get_viewport_rect()
	
	top_left = camera.global_position - Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)
	bottom_right = camera.global_position + Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)
	
	direction = direction.normalized()

func _process(delta: float) -> void:
	self.linear_velocity = direction * speed * delta * 100
	if (follow_rotation && spriteContainer != null):
		spriteContainer.rotation = atan2(-direction.x, direction.y)
	if (self.global_position.x <= top_left.x && state_bounce_x != "left"):
		bounce("left", true)
	if (self.global_position.y <= top_left.y && state_bounce_y != "top"):
		bounce("top", false)
	if (self.global_position.x >= bottom_right.x && state_bounce_x != "right"):
		bounce("right", true)
	if (self.global_position.y >= bottom_right.y && state_bounce_y != "bottom"):
		bounce("bottom", false)

func load_player(texture: Texture2D, weapon: PackedScene):
	spriteContainer = $Sprite
	add_child(weapon.instantiate())
	super(texture, weapon)

func bounce(new_state_bounce: String, horizontal: bool):
	if (horizontal):
		direction.x = -direction.x
		state_bounce_x = new_state_bounce
	else:
		direction.y = -direction.y
		state_bounce_y = new_state_bounce
