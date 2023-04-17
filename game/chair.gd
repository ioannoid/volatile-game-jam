class_name Chair extends RigidBody2D

var velocity := Vector2(0,0)
var pushed := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	
func _integrate_forces(state : PhysicsDirectBodyState2D):
	if pushed:
		state.linear_velocity = velocity
		pushed = false
	state.linear_velocity = 0.8*state.linear_velocity

func push(motion : Vector2, speed : int):
	velocity = speed * motion
	pushed = true
