extends Node2D

@onready var current_background = $Background
@onready var prev_background = $Background2

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
	current_background.offset.y += scrollSpeed * delta
	prev_background.offset.y += scrollSpeed * delta

func randomBackground():
	if backgroundPic.size()>0:
		if current_background.texture != null:
			prev_background.texture = current_background.texture
			prev_background.offset.y = current_background.offset.y
		current_background.texture = backgroundPic.pick_random()
		current_background.offset.y = 0
		if prev_background.texture != null:
			current_background.modulate.a = 0
			prev_background.modulate.a = 1
			while current_background.modulate.a < 1:
				current_background.modulate.a += 0.01
				prev_background.modulate.a -= 0.01
				await get_tree().process_frame
