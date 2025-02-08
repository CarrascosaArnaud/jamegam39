extends Marker2D

@export var text = "An Auto-shot ?! 
NEVER JOHN FITZGERALD KENNEDY WOULD LET THIS HAPPEN !!"
@export var apresAffichage = 2.0
@export var avantAffichage = 0.0
@export var label : Label
@export var SPEED = 1.5;

var playedOnce = true
var play = false

signal text_finish

func _ready():
	label.visible_ratio = 0
	display_text()

func _process(delta):
	if (play && label.visible_ratio < 1):
		label.visible_ratio += SPEED * delta
	elif(play):
		label.visible_ratio = 1

func display_text():
	playedOnce = false
	label.text = text
	label.visible_ratio = 0
	await get_tree().create_timer(avantAffichage).timeout
	play = true
	await get_tree().create_timer(apresAffichage).timeout
	label.visible_ratio = 0
	text_finish.emit()
	queue_free()

func _on_text_sound_finished():
	return true
