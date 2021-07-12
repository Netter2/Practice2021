extends KinematicBody2D

var startpoint
var svector = Vector2 (200, 24)
var speed = 200
var leftpoint
var rightpoint
var lbuffer
var rbuffer
var flag = false
var shielded = false

func _ready():
	startpoint = global_position.x
	leftpoint = startpoint - 300
	rightpoint = startpoint + 300
	lbuffer = leftpoint
	rbuffer = rightpoint
	

func _process(delta):
	if flag:
		$SkeletonAnim.set_animation("Attacking")
	else:
		$SkeletonAnim.set_animation("Walking")
		if !is_on_floor():
			svector.y += 24
		else:
			svector.y = 24
			if global_position.x <= leftpoint:
				rightpoint = rbuffer
				svector.x = speed
				$SkeletonAnim.set_flip_h(false)
				$SkeletonAnim.position.x *= -1
				$Hurtbox.position.x *= -1
				$Vision/VisionColl.position.x *= -1
				$Hitbox/HitboxColl.position.x *= -1
			elif global_position.x >= rightpoint:
				leftpoint = lbuffer
				svector.x = -speed
				$SkeletonAnim.set_flip_h(true)
				$SkeletonAnim.position.x *= -1
				$Hurtbox.position.x *= -1
				$Vision/VisionColl.position.x *= -1
				$Hitbox/HitboxColl.position.x *= -1
		move_and_slide (svector, Vector2(0, -1));


func _on_Vision_body_entered(body):
	if body.name == "Shield":
		shielded = true
		if svector.x > 0:
			rightpoint = global_position.x
		else:
			leftpoint = global_position.x
	elif body.name == "Hero" and shielded == true:
		if svector.x > 0:
			rightpoint = global_position.x
		else:
			leftpoint = global_position.x
	elif body.name == "Hero" and shielded == false:
		flag = true
	else:
		if svector.x > 0:
			rightpoint = global_position.x
		else:
			leftpoint = global_position.x
	


func _on_SkeletonAnim_animation_finished():
	if $SkeletonAnim.animation == "Attacking":
		flag = false
		$Vision/VisionColl.set_disabled (false)
		$Hurtbox/HurtboxColl.set_disabled(true)

func _on_SkeletonAnim_frame_changed():
	if $SkeletonAnim.animation == "Attacking" and $SkeletonAnim.frame == 1:
		$Vision/VisionColl.set_disabled (true)
	if $SkeletonAnim.animation == "Attacking" and $SkeletonAnim.frame == 3:
		$Hurtbox/HurtboxColl.set_disabled(false)
	


func _on_Hurtbox_body_entered(body):
	if body.name == "Hero":
		$"/root/Global".health -= 1


func _on_Vision_body_exited(body):
	if body.name == "Shield":
		shielded = false


func _on_Hitbox_area_entered(area):
	if area.name == "HeroHitbox":
		queue_free ()
