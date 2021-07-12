extends Button

func _ready():
	pass


func _on_GORetry_pressed():
	get_tree().change_scene("res://Node.tscn")
	$"/root/Global".health = 6;
