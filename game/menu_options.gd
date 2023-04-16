extends RichTextLabel
signal change_scene

var rng = RandomNumberGenerator.new()
var clr = Color.RED
var val = rng.randi_range(0,5);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_mouse_entered():
		add_theme_color_override("default_color", clr)
	
func _on_mouse_exited():
	match val:
		0:
			clr = Color.RED
		1:
			clr = Color.AQUA
		2:
			clr = Color.BLUE
		3: 
			clr = Color.CORNFLOWER_BLUE
		4: 
			clr = Color.GREEN
		5: 
			clr = Color.GOLD
	val = rng.randi_range(0,5);
	add_theme_color_override("default_color", Color.WHITE)
