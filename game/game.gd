extends Node2D
signal updateGirl(val)

@export var current_scene : PackedScene
var current_node : Node
var state = 0
var hasKey = 0

enum GAME_STATE{
	startSequence,
	bathroomSequence,
	aloneSequence,
	endingSequence
}

# Called when the node enters the scene tree for the first time.
func _ready():
	if !current_scene:
		print("No scene available to load")
	else:
		current_node = current_scene.instantiate()
		add_child(current_node)
	updateGirl.connect(get_node("Girl").girlUpdate)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func switch_room(scene : String):
	print("Switching room..")
	current_node.queue_free()
	current_scene = load(scene) 
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
			updateGirl.emit(1)
		GAME_STATE.aloneSequence:
			state = GAME_STATE.aloneSequence
			print("changing to alone sequence")
		GAME_STATE.endingSequence:
			state = GAME_STATE.endingSequence
			print("changing to ending sequence")

func music_updater(scene : int):
	match scene:
		0:
			$kitchenTheme.stop()
			$bathroomTheme.stop()
			$walkingTheme.play()
			print("Walking theme!")
		1:
			$bathroomTheme.stop()
			$walkingTheme.stop()
			$kitchenTheme.play()
			print("Kitchen theme!")
		2:
			$walkingTheme.stop()
			$kitchenTheme.stop()
			$bathroomTheme.play()
			print("Bathroom theme!")
		3:
			$walkingTheme.stop()
			$kitchenTheme.stop()
			$bathroomTheme.stop()
			$creditsTheme.play()
			$Girl.hide()
			$Girl.crying = true
			print("Credits theme!")
