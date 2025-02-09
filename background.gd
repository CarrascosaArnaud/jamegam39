extends Sprite2D

@export var backgroundPic: Array[Texture2D]
@export var scrollSpeed: float = 20.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomBackground() 
	var timer = Timer.new()
	timer.wait_time = 10
	timer.autostart = true
	timer.timeout.connect(randomBackground)
	add_child(timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset.y += scrollSpeed * delta
	

func randomBackground():
	if backgroundPic.size()>0:
		texture = backgroundPic.pick_random()
		offset.y = 0
