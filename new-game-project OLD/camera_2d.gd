extends Camera2D
@export var player: NodePath  # assign via inspector to your Player node
@export var follow_speed : float = 10.0
@export var current = true
#------New code------
@export var player_path: NodePath
@export var smooth_speed = 5.0
var player1: Node2D
var highest_y_position: float
#----------------------


func _ready() -> void:
	current = true  # Activate this camera
	
	#---------New Code------------------------------------
	if player_path:
		player1 = get_node(player_path)
	else:
	# Try to find player automatically
		player1 = get_tree().get_first_node_in_group("player")
	if player:
	# Initialize camera position
		global_position = player1.global_position
		highest_y_position = player1.global_position.y
	else:
		print("Warning: Player not found for camera!")
	#-----------------------------------------------------------

func _process(delta: float) -> void:
	var target = get_node(player) as Node2D
	if target:
		position.y = target.position.y
		#position.x = some_fixed_x
	#-----------------New code--------------------------
	if not player:
		return
# Update highest position if player has climbed higher
	if player1.global_position.y < highest_y_position:
		highest_y_position = player1.global_position.y
	# Camera follows player horizontally and upward only
		var target_position = Vector2(player1.global_position.x,highest_y_position)
	# Smooth camera movement
		global_position = global_position.lerp(target_position, smooth_speed * delta)
			
