extends AnimatedSprite2D

var t = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta * 4
	if t < 0.5 : scale = Vector2(t,t)
	else : get_parent().remove_child(self)
