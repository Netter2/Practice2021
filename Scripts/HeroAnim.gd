extends AnimatedSprite

var direction = "right";
var timer = 1

func _ready():
	set_speed_scale(0.5);
	
	



func _process(delta):
	if (timer >= 1):
		if Input.is_action_just_pressed("ui_up"):
			timer = -45;
			if direction == "right":
				set_animation ("RJump");
			else:
				set_animation ("LJump");
		elif Input.is_action_pressed("ui_ctrl"):
			if direction == "right":
				set_animation ("RShield");
			else:
				set_animation ("LShield");
		elif Input.is_action_pressed("ui_right"):
			direction = "right";
			set_animation ("RMovement");
			set_speed_scale(1);
		elif Input.is_action_pressed("ui_left"):
			direction = "left";
			set_animation ("LMovement");
			set_speed_scale(1);
		elif Input.is_action_just_pressed("ui_accept"):
			timer = -45;
			if direction == "right":
				set_animation ("RAttack");
			else:
				set_animation ("LAttack");
		else:
			set_speed_scale(0.5);
			if direction == "right":
				set_animation ("Rdefault");
			else:
				set_animation ("Ldefault");
	else:
		timer = timer + 1;

