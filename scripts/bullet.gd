class_name Bullet extends Area2D

static var bullet = preload("res://scenes/bullet.tscn")
static var explo = preload("res://assets/UFO/explo.tscn")

static func shoot(from: Vector2, toward: Vector2, at: float):
	var b = bullet.instantiate()
	b.global_position = from
	b.velocity = from.direction_to(toward) * at
	b.look_at(toward)
	return b

var velocity = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered",_area_entered)
	connect("body_entered",_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity)

func _area_entered(area):
	print(area)
	
func _body_entered(area):
	print(area.name + " touché !")
	var e = explo.instantiate()
	e.global_position = global_position
	var p = get_parent()
	if p : 
		p.add_child(e)
		p.remove_child(self)
