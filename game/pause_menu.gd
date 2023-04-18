extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var resume_button: Button = find_child("Resume")
@onready var quit_button: Button = find_child("Quit")

func _ready() -> void:
	resume_button.pressed.connect(unpause)
	quit_button.pressed.connect(quit)

func unpause():
	animator.play("Unpause")
	get_tree().paused = false

func pause():
	animator.play("Pause")
	get_tree().paused = true
	
func quit():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
