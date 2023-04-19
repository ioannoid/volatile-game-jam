extends Door
var game
signal music_update(scene)
# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().get_root().get_node("Main").get_node("Game")
	music_update.connect(game.music_updater)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if game.hasKey == 1 and event.is_action_pressed("Interact"):
		if target_scene.is_empty():
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 0:
			next_room()
			music_update.emit(1)
