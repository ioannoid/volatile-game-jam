extends Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("Interact"):
		hide()
		var game = get_tree().get_root().get_node("Main").get_node("Game")
		game.hasKey = 1
