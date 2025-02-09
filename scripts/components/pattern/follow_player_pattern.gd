extends Enemy

@export var speed = 100
@export var follow_rotation : bool = true

var player
var weaponInstance

func _ready() -> void:
	super()
	player = get_tree().current_scene.find_child("Player")

func load_player(texture: Texture2D, weapon: PackedScene, direction: Vector2):
	spriteContainer = $Sprite
	weaponInstance = weapon.instantiate()
	add_child(weaponInstance)
	super(texture, weapon, direction)

func _physics_process(delta: float) -> void:
	var direction_player = self.global_position.direction_to(player.global_position)
	if ((player.global_position - self.global_position).length() > 10.0):
		self.linear_velocity = direction_player * speed * delta * 100
	else:
		self.linear_velocity = Vector2.ZERO

func _process(delta: float) -> void:
	super(delta)
	var direction_player = self.global_position.direction_to(player.global_position)
	if (follow_rotation && spriteContainer != null):
		spriteContainer.rotation = atan2(-direction_player.x, direction_player.y)
	if (weaponInstance != null):
		weaponInstance.rotation = -self.rotation
