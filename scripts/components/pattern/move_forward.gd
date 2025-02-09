extends Enemy

# speed in px per second
@export var speed = 100
@export var direction : Vector2 = Vector2(0, 1)
@export var follow_rotation : bool = true

func _ready() -> void:
	super()
	direction = direction.normalized()
	self.rotation = atan2(-direction.x, direction.y)

func load_player(texture: Texture2D, weapon: PackedScene, new_direction: Vector2):
	spriteContainer = $Sprite
	var weaponInstance = weapon.instantiate()
	add_child(weaponInstance)
	direction = new_direction
	self.rotation = atan2(-direction.x, direction.y)
	weaponInstance.rotation = -self.rotation
	super(texture, weapon, new_direction)

func _physics_process(delta: float) -> void:
	self.linear_velocity = direction * speed * delta * 100
