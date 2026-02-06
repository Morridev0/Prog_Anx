extends Control

@onready var spawner = $Spawner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner._start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
