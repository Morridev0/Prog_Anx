extends Node2D

@export var item_scene: PackedScene
@export var spawn_y := -40
@export var spawn_width := 800


@onready var items = $"../Items"
@onready var spawn_timer = $"../Timer_Spawn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.timeout.connect(Callable(self, "spawn"))
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn():
	var item := item_scene.instantiate()
	item.position = Vector2(randf_range(0, spawn_width), spawn_y)
	
	items.add_child(item)

# Flujo

func _start_game():
	spawn_timer.start()


func _end_game():
	spawn_timer.stop()
