extends Area2D


@export var textures: Array[Texture2D]
@export var fall_speed := 300.0

@onready var sprite := $Sprite2D
@onready var item := $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if textures.size() > 0:
		sprite.texture = textures.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	item.position.y += fall_speed * delta
