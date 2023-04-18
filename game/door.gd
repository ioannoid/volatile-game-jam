extends Area2D

@export var target_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Interact"):
		if !target_scene:
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 1:
			next_room()

func next_room():
	var ERR = get_parent().get_parent().switch_room(target_scene)
	if ERR != OK:
		print("Something failed in the door scene") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
