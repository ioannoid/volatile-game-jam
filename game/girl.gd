extends CharacterBody2D
@export var speed = 100
var screen_size
var prev_velocity = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	# $AnimatedSprite2D.scale = Vector2(2, 2)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame
func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x +=1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop() 
	position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
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