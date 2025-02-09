extends Enemy

@export var speed = 1000
@export var direction : Vector2 = Vector2(-1, 1)
@export var follow_rotation : bool = true

var state_bounce_x = null
var state_bounce_y = null
var is_out_screen: bool

func _ready() -> void:
	super()
	spriteContainer = $Sprite
	var camera = get_viewport().get_camera_2d()
	var viewport_rect = camera.get_viewport_rect()
	
	top_left = camera.global_position - Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)
	bottom_right = camera.global_position + Vector2(viewport_rect.size.x / 2, viewport_rect.size.y / 2)
	
	direction = direction.normalized()
	
	if (self.global_position.x <= top_left.x ||
	self.global_position.y <= top_left.y ||
	self.global_position.x >= bottom_right.x ||
	self.global_position.y >= bottom_right.y):
		is_out_screen = true
 
func _physics_process(delta: float) -> void:
	speed += 1000 * delta
	self.linear_velocity = direction * speed * delta * 100

func _process(delta: float) -> void:
	if (is_out_screen):
		if (self.global_position.x > top_left.x &&
		self.global_position.y > top_left.y &&
		self.global_position.x < bottom_right.x &&
		self.global_position.y < bottom_right.y):
			is_out_screen = false
		else:
			return;
	
	super(delta)
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

func bounce(new_state_bounce: String, horizontal: bool):
	if (horizontal):
		direction.x = -direction.x
		state_bounce_x = new_state_bounce
	else:
		direction.y = -direction.y
		state_bounce_y = new_state_bounce


func _on_area_2d_area_entered(area: Area2D) -> void:
	var enemy = area.get_parent()
	enemy = enemy if enemy is Enemy else enemy.get_parent()
	enemy.queue_free()
