extends Door
signal music_update(scene)
var game
# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().get_root().get_node("Main").get_node("Game")
	music_update.connect(game.music_updater)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func next_room():
	get_parent().get_parent().get_node("Camera").room_size = room_size
	get_parent().get_parent().get_node("Girl").position.x = 32 + 64 * player_pos.x
	get_parent().get_parent().get_node("Girl").position.y = 32 + 64 * player_pos.y
	music_update.emit(3) 
	var ERR = get_parent().get_parent().switch_room(target_scene)
	if ERR != OK:
		print("Something failed in the door scene")

