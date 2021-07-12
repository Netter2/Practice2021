extends TileMap
func _ready():
	pass


func _process(delta):
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Hero":
		get_tree().change_scene("res://EndScene.tscn")
