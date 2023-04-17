extends Node

var main_menu
var game
var credits

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = load("res://main_menu.tscn")
	game = load("res://game.tscn")
	credits = load("res://credits.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/NewGame.option_clicked.connect(menu_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Exit.option_clicked.connect(menu_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Credits.option_clicked.connect(menu_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Settings.option_clicked.connect(menu_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Continue.option_clicked.connect(menu_handler)
	pass # Replace with function body.


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
			var instance = main_menu.instantiate()
			add_child(instance)
		0:
			_switch_scene()
		1:
			pass
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
