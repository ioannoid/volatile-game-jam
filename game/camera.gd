extends Camera2D

var room_size = Vector2(7,5)

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var view_size = get_viewport_rect().size / get_canvas_transform().get_scale()
	position.x = clamp(get_parent().get_node("Player").position.x, -room_size.x*64 + view_size.x/2, room_size.x*64 - view_size.x/2)
	position.y = clamp(get_parent().get_node("Player").position.y, -room_size.y*64 + view_size.y/2, room_size.y*64 - view_size.y/2)
