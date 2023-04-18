extends Node2D

@export var current_scene : PackedScene
var current_node : Node
<<<<<<< Updated upstream
var state = 0

enum GAME_STATE{
	startSequence,
	bathroomSequence,
	aloneSequence,
	endingSequence
}

=======
>>>>>>> Stashed changes
# Called when the node enters the scene tree for the first time.
func _ready():
	if !current_scene:
		print("No scene available to load")
	else:
		current_node = current_scene.instantiate()
		add_child(current_node)
		save_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func switch_room(scene : PackedScene):
	print("Switching room..")
	current_node.queue_free()
	current_scene = scene 
	current_node = current_scene.instantiate()
	add_child(current_node)
	return OK
	
func sequenceUpdater(seq : int):
	match seq:
		GAME_STATE.startSequence:
			state = GAME_STATE.startSequence
			print("changing to start sequence")
		GAME_STATE.bathroomSequence: 
			state = GAME_STATE.bathroomSequence
			print("changing to bathroom sequence")
		GAME_STATE.aloneSequence:
			state = GAME_STATE.aloneSequence
			print("changing to alone sequence")
		GAME_STATE.endingSequence:
			state = GAME_STATE.endingSequence
			print("changing to ending sequence")

<<<<<<< Updated upstream
=======
func save_game():
	var save_game = FileAccess.open("res://savegame.json", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
				# Call the node's save function.
		var node_data = node.call("save")
		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)
		# Store the save dictionary as a new line in the save file.
		save_game.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("res://savegame.json"):
		return # Error! We don't have a save to load.
	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_game = FileAccess.open("res://savegame.json", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		# Creates the helper class to interact with JSON
		var json = JSON.new()
	# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		# Get the data from the JSON object
		var node_data = json.get_data()
		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
>>>>>>> Stashed changes
