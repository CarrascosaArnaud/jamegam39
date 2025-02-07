class_name Bullet extends Area2D

static var bullet = preload("res://scenes/bullet.tscn")

static func shoot(from: Vector2, toward: Vector2, at: float):
	var b = bullet.instantiate()
	b.global_position = from
	b.velocity = from.direction_to(toward) * at
	b.look_at(toward)
	return b

var velocity = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#velocity = Vector2.from_angle(rotation_degrees) * 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity)
