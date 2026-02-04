extends Control

signal minigame_finished(succes: bool)

@export var ready_time := 1.0 # Grace time
@export var game_time := 5.0 # Time to win
@export var input_goal := 200 # Input goal
@export var max_visible_chars := 35

var input_count := 0
var char_list: Array[String] = []

@onready var input_line_label := $UI/HBC/Input_Line
var typed_text := ""
@onready var order_label := $UI/HBC/Order_L
@onready var counter_label := $UI/HBC/Count_L
@onready var result_label := $UI/HBC/Result_L
@onready var game_timer := $Timer_L
@onready var ready_timer:= $Ready_Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	result_label.visible = false
	counter_label.text = "0 / %d" % input_goal
	
	ready_timer.wait_time = ready_time
	game_timer.wait_time = game_time
	_color()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Flujo de juego

func _start_grace_period():
	order_label.text = "TYPE!!!"
	game_timer.start()

func _on_game_finished():
	_end_minigame(input_count > input_goal)

func _end_minigame(success: bool):
	result_label.visible = true
	
	if success:
		result_label.text = "COMMITED AND PUSHED"
	else:
		result_label.text = "FIRED!!!"
	
	minigame_finished.emit(success)


# Lector de inputs / mecánicas

func _input(event):
	if event is InputEventKey:
		_handle_key(event)

func _handle_key(event: InputEventKey):
	input_count += 1
	counter_label.text = "%d / %d" % [input_count, input_goal]  # Numeritos
	
	var char: String
	if event.unicode > 0:
		char = String.chr(event.unicode)
	else:
		char = ""
	
	char_list.append(char)
	if char_list.size() > max_visible_chars:
		char_list.pop_front()
	
	if input_count % 2 == 0:

		input_line_label.position += Vector2(randf_range(-5, 3), randf_range(-3, 5)) # Shake
	
	input_line_label.text = "".join(char_list)  # Inputs


func _color():
	var tween := create_tween()
	tween.set_loops()
	order_label.modulate = Color(1.0, 1.0, 1.0, 0.6)
	tween.tween_property(order_label, "modulate:a", 1.0, 0.5)
	tween.tween_property(order_label, "modulate:a", 0.5, 1)
	
	tween.tween_property(order_label, "modulate:r", 1.0, 0.1)
	tween.tween_property(order_label, "modulate:r", 0.1, 1.0)
	
	tween.tween_property(order_label, "modulate:g", 1.0, 0.1)
	tween.tween_property(order_label, "modulate:g", 0.1, 1.0)
	
	tween.tween_property(order_label, "modulate:b", 1.0, 0.1)
	tween.tween_property(order_label, "modulate:b", 0.1, 1.0)
