extends CharacterBody2D
@export var speed = 100
var screen_size
var prev_velocity := Vector2(0,0)
var stopped := false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 0
	position.y = 0

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop() 
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x > 0
		prev_velocity = velocity
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "back"
		$AnimatedSprite2D.flip_v = false
		prev_velocity = velocity
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "forward"
		$AnimatedSprite2D.flip_v = false
		prev_velocity = velocity
	else:
		if prev_velocity.x != 0:
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = prev_velocity.x > 0
		elif prev_velocity.y < 0:
			$AnimatedSprite2D.animation = "back"
			$AnimatedSprite2D.flip_v = false
		else:
			$AnimatedSprite2D.animation = "forward"
			$AnimatedSprite2D.flip_v = false

# Called every frame. 'delta' is the elapsed time since the previous frame
func _physics_process(delta):
	if not stopped:
		var motion = Vector2(0,0)
		if Input.is_action_pressed("move_right"):
			motion.x += 1
		if Input.is_action_pressed("move_left"):
			motion.x += -1
		if Input.is_action_pressed("move_up"):
			motion.y += -1
		if Input.is_action_pressed("move_down"):
			motion.y += 1
		
		velocity = motion * speed
		
		move_and_slide()
		if get_slide_collision_count() > 0:
			check_collision(motion)
	
func check_collision(motion : Vector2):
	if abs(motion.x) + abs(motion.y) > 1:
		return
	var object := get_slide_collision(0).get_collider() as Chair
	if object: 
		object.push(motion, speed)















