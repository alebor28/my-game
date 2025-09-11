# CameraController.gd - Attach this to a Camera2D node
extends Camera2D

@export var player_path: NodePath
@export var smooth_speed = 5.0

var player: Node2D
var highest_y_position: float

func _ready():
	if player_path:
		player = get_node(player_path)
	else:
		# Try to find player automatically
		player = get_tree().get_first_node_in_group("player")
	
	if player:
		# Initialize camera position
		global_position = player.global_position
		highest_y_position = player.global_position.y
	else:
		print("Warning: Player not found for camera!")

func _process(delta):
	if not player:
		return
	
	# Update highest position if player has climbed higher
	if player.global_position.y < highest_y_position:
		highest_y_position = player.global_position.y
	
	# Camera follows player horizontally and upward only
	var target_position = Vector2(
		player.global_position.x,
		highest_y_position
	)
	
	# Smooth camera movement
	global_position = global_position.lerp(target_position, smooth_speed * delta)
