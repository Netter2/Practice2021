extends KinematicBody2D

var svector = Vector2(0, 0);
var speed = -400;

func _ready():
	speed = 0;
	
func _process(delta):
	if !is_on_floor():
		svector.y += 24;
	else:
		svector.y = 24;
		svector.x = speed;
	move_and_slide (svector, Vector2(0, -1));

	


func _on_Hitbox_body_entered(body):
	speed *= -1;
	if body.name == "Hero":
		$"/root/Global".health -= 1;


func _on_Trigger_body_entered(body):
	if body.name == "Hero":
		speed = -400
		$Trigger/TriggerColl.set_disabled(true)
