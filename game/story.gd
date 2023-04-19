extends Node2D
signal exit_credits

const section_time := 4.0
const line_time := 0.3
const base_speed := 100
const speed_up_multiplier := 10.0
const title_color := Color.WHITE

var main_menu
var game
var scroll_speed := base_speed
var speed_up := false

@onready var line := $StoryContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"She is woken by the feeling of warmth over her"
	],[
		"She crawls out of bed cluching her teddy bear" 
	],[
		"She has to call 911, the but the roaring fires block her path"
	],[
		"The house is wrong.",
		"The house is all wrong"
	],[
		"She is washed over with hopelessness"
	],
]

func _process(delta):
	@warning_ignore("shadowed_variable")
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.global_position.y -= scroll_speed
			if l.global_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		exit_credits.emit(-1)
		
func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_theme_color_override("font_color", title_color)
	$StoryContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		exit_credits.emit(-1)	
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
