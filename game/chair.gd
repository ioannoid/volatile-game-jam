class_name Chair extends RigidBody2D
signal finished


var push_dir := Vector2(0,0)
var last_pos := Vector2(0,0)
var pushed := false
var is_chair := true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	if pushed:
		state.set_linear_velocity(100*push_dir)
		if abs(position.x - last_pos.x) >= 64 or abs(position.y - last_pos.y) >= 64:
			state.set_linear_velocity(Vector2(0,0))
			pushed = false
			finished.emit()
	else:
		state.set_linear_velocity(Vector2(0,0))
	#state.set_linear_velocity(Vector2(0, vel.y))
func push(motion : Vector2):
	if not pushed:
		push_dir = motion
		last_pos = position
		pushed = true
	
