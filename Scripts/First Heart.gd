extends AnimatedSprite

func _ready():
	pass

func _process(delta):
	if $"/root/Global".health > 1:
		set_animation ("Full");
	elif $"/root/Global".health == 1:
		set_animation ("Half");
	else:
		set_animation ("Empty");
