extends Door
signal sequenceUpdate(sequence)
signal music_update(scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	var game = get_tree().get_root().get_node("Main").get_node("Game")
	sequenceUpdate.connect(game.sequenceUpdater)
	music_update.connect(game.music_updater)

func _input(event):
	if event.is_action_pressed("Interact"):
		if get_overlapping_bodies().size() > 0:
			sequenceUpdate.emit(1)
			music_update.emit(2)
			next_room()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
