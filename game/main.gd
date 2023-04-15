extends Node

var main_menu
var game

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = load("res://main_menu.tscn")
	game = load("res://game.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	$MainMenu/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/NewGame.gui_input.connect(_on_gui_input)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _switch_scene():
	$MainMenu.queue_free()
	var instance = game.instantiate()
	add_child(instance)
	
func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			_switch_scene()
