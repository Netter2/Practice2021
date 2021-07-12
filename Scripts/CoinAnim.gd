extends AnimatedSprite

func _ready():
	pass




func _on_Coin_body_entered(body):
	if body.name == "Hero":
		set_visible (false);
