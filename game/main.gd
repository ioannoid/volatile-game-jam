extends Node

var main_menu
var game
var credits
var pause
var story
var i = 0

var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not started:
		main_menu = load("res://main_menu.tscn")
		game = preload("res://game.tscn")
		credits = load("res://credits.tscn")
		story = load("res://story.tscn")
		pause = preload("res://main_menu.tscn")
		started = true
	var instance = main_menu.instantiate()
	add_child(instance)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/NewGame.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Exit.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Credits.option_clicked.connect(menu_handler)
	#$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Settings.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Story.option_clicked.connect(menu_handler)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _switch_scene():
	$MainMenu.queue_free()
	var instance = game.instantiate()
	add_child(instance)
	
func menu_handler(button):
	print(button)
	match button:
		-1:
			for n in get_children():
				n.queue_free()
			_ready()
		0:
			_switch_scene()
		1:
			for n in get_children():
				n.queue_free()
			var instance = story.instantiate()
			add_child(instance)
			$Control/Control/story.exit_story.connect(menu_handler)
		2: 
			pass
		3: 
			for n in get_children():
				n.queue_free()
			var instance = credits.instantiate()
			add_child(instance)
			$Control/Control/credits.exit_credits.connect(menu_handler)
		4: 
			get_tree().quit()
