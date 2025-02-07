extends Enemy

# speed in px per second
@export var speed = 100
@export var direction : Vector2 = Vector2(0, 1)
@export var follow_rotation : bool = true

func _ready() -> void:
	direction = direction.normalized();
	self.rotation = atan2(-direction.x, direction.y);

func load_player(texture: Texture2D, weapon: PackedScene, new_direction: Vector2):
	spriteContainer = $Sprite
	add_child(weapon.instantiate())
	direction = new_direction;
	self.rotation = atan2(-direction.x, direction.y);
	super(texture, weapon, new_direction)

func _process(delta: float) -> void:
	self.linear_velocity = direction * speed * delta * 100;
