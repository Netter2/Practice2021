extends KinematicBody2D

const speed = 200;
var svector = Vector2(0, 0);
var timer = 1;
var score = 0;
var shielded = false

func _ready():
	pass



func _process(delta):
	if Input.is_action_just_released("ui_ctrl"):
		$Shield/ShieldColl.set_disabled(true)
	if $"/root/Global".health <= 0:
		get_tree().change_scene("res://Game Over.tscn")
	if !is_on_floor():
		svector.y += 24;
	else:
		svector.y = 24;
	if timer >= 1:
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				svector.y = -500;
		if Input.is_action_pressed("ui_ctrl"):
			svector.x = 0;
			$Shield/ShieldColl.set_disabled(false)
		elif Input.is_action_pressed("ui_left"):
			svector.x =  -speed;
			$Shield/ShieldColl.position.x = -25.7
			$HeroHitbox.position.x = -40
			$HeroHitbox/HitboxAnim.set_flip_h(false)
		elif Input.is_action_pressed("ui_right"):
			svector.x =  speed;
			$Shield/ShieldColl.position.x = 25.7
			$HeroHitbox.position.x = 40
			$HeroHitbox/HitboxAnim.set_flip_h(true)
		elif Input.is_action_just_pressed("ui_accept"):
			$HeroHitbox/HitboxAnim.set_animation("default")
			$HeroHitbox/HitboxColl.set_disabled(false)
			timer = -45;
			svector.x = 0;
		else:
			svector.x = 0;
	else:
		timer = timer + 1;
	move_and_slide (svector, Vector2(0, -1));



func _on_HitboxAnim_animation_finished():
	if $HeroHitbox/HitboxAnim.animation == "default":
		$HeroHitbox/HitboxAnim.set_animation("Empty")
		$HeroHitbox/HitboxColl.set_disabled(true)
