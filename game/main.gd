extends Node

var main_menu
var game

# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = load("res://node_2d.tscn")
	game = load("res://area_2d.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	instance.get_node("/root/Node/Control/MarginContainer/HBoxContainer/VBoxContainer/MenuItems/RichTextLabel2").gui_input.connect(_on_gui_input)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _switch_scene():
	get_node("/root/Node/Control").queue_free()
	var instance = game.instantiate()
	add_child(instance)
	
func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			_switch_scene()
