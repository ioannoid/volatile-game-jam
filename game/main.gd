extends Node

var main_menu
var game

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = load("res://main_menu.tscn")
	game = load("res://game.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/NewGame.gui_input.connect(ng_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Exit.gui_input.connect(exit_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Credits.gui_input.connect(credits_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Settings.gui_input.connect(settings_handler)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/Continue.gui_input.connect(cg_handler)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _switch_scene():
	$MainMenu.queue_free()
	var instance = game.instantiate()
	add_child(instance)
	
func ng_handler(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			_switch_scene()

func settings_handler(event):
	pass

func cg_handler(event):
	pass
	
func exit_handler(event):
	pass

func credits_handler(event):
	pass
