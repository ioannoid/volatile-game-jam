extends Area2D

func _ready():
	hide()
	$KitchenLock.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_key_hint_body_entered(body):
	var game = get_tree().get_root().get_node("Main").get_node("Game")
	if game.hasKey == 1:
		$KitchenLock.play("unlocked")
	show()
		

func _on_body_exited(body):
	hide()
