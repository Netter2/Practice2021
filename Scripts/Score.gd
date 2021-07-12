extends Label

var localscore = 0;

func _ready():
	set_text (String(localscore));

func _on_Coin_body_entered(body):
	if body.name == "Hero":
		localscore += 1000;
		$"/root/Global".score += 1000;

func _process(delta):
	set_text (String(localscore));

