extends PathFollow2D

var x = 0

func _ready():
	set_offset(0)


func _process(delta):
	x += 1
	set_offset (x)
