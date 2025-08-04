extends Camera2D


@export var player : Node2D
@export var follow_speed : float = 10.0
@export var current = true

func _ready() -> void:
	current = true  # Activate this camera

func _process(delta: float) -> void:
	# Smoothly follow the player's vertical position
	position.y = lerp(position.y, player.position.y, follow_speed * delta)
