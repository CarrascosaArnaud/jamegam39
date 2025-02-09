class_name Bullet extends Area2D

static var bullet = preload("res://scenes/bullet.tscn")
static var explo = preload("res://assets/UFO/explo.tscn")

static func shoot(from: Vector2, to: Vector2, at: float, margin: float = 10):
	var b = bullet.instantiate()
	b.global_position = from
	b.look_at(to)
	b.global_position = from.move_toward(to,margin)
	b.velocity = from.direction_to(to) * at
	return b

var velocity = Vector2.RIGHT
@onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered",_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)

func _area_entered(area):
	var e = explo.instantiate()
	e.global_position = global_position
	parent.add_child(e)
	parent.remove_child(self)
	if (area as HealthComponent):
		(area as HealthComponent).damage(1)
	queue_free()
