extends Camera2D

var room_size = Vector2(100,100)

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = clamp(get_parent().get_node("Player").position.x, 0, room_size.x)
	position.y = clamp(get_parent().get_node("Player").position.y, 0, room_size.y)
	
