extends CollisionShape2D

var flag = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Coin_body_entered(body: Node):
	if body.name == "Hero":
		flag = true;

func _process(delta):
	set_disabled (flag);
