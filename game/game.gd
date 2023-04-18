extends Node2D

@export var current_scene : PackedScene
var current_node : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	if !current_scene:
		print("No scene available to load")
	else:
		current_node = current_scene.instantiate()
		add_child(current_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch_room(path : String):
	current_node.queue_free()
	current_scene = load(path)
	current_node = current_scene.instantiate()
	add_child(current_node)
	return OK
