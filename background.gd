extends Sprite2D

@export var backgroundPic: Array[Texture2D]
@export var scrollSpeed: float = 20.0

func _ready() -> void:
	randomBackground() 
	var timer = Timer.new()
	timer.wait_time = 10
	timer.autostart = true
	timer.timeout.connect(randomBackground)
	add_child(timer)

func _process(delta: float) -> void:
	offset.y += scrollSpeed * delta

func randomBackground():
	if backgroundPic.size()>0:
		texture = backgroundPic.pick_random()
		offset.y = 0
