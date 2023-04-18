extends Area2D

@export var target_scene: String
@export var player_pos: Vector2
@export var room_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("Interact"):
		if target_scene.is_empty():
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 0:
			next_room()

func next_room():
	get_parent().get_parent().get_node("Camera").room_size = room_size
	get_parent().get_parent().get_node("Girl").position.x = 32 + 64 * player_pos.x
	get_parent().get_parent().get_node("Girl").position.y = 32 + 64 * player_pos.y
	var ERR = get_parent().get_parent().switch_room(target_scene)
	if ERR != OK:
		print("Something failed in the door scene") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
