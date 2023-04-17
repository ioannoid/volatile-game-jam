extends Node

var main_menu
var game

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = load("res://main_menu.tscn")
	game = load("res://game.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/NewGame.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Exit.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Credits.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Settings.option_clicked.connect(menu_handler)
	$MainMenu/Layout/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Continue.option_clicked.connect(menu_handler)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _switch_scene():
	$MainMenu.queue_free()
	var instance = game.instantiate()
	add_child(instance)
	
func menu_handler(button):
	match button:
		0:
			_switch_scene()
