extends TextureRect

@onready var background = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start_pulse()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _start_pulse():
	var tween := create_tween()
	tween.set_loops()
	tween.tween_property(background, "modulate:a", 1, 0.9).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(background, "modulate:a", 0.8, 0.9).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
