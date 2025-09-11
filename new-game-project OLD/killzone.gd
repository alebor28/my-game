extends Area2D
@export var camera_path: NodePath
@export var offset_below_camera = 100.0
var camera: Camera2D
var collision_shape: CollisionShape2D
func _ready() -> void:
	# Get camera reference
	if camera_path:
		camera = get_node(camera_path)
	else:
		camera = get_tree().get_first_node_in_group("camera")
	if not camera:
		print("Warning: Camera not found for killzone!")
		return
	# Create collision shape
	collision_shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = Vector2(10000, 100) # Wide killzone
	collision_shape.shape = rect_shape
	add_child(collision_shape)
	# Connect the body_entered signal
	body_entered.connect(_on_body_entered)
func _process(delta: float) -> void:
	if not camera:
		return
	# Position killzone below camera's bottom edge
	var camera_bottom = camera.global_position.y + get_viewport().size.y / (2 *camera.zoom.y)
	global_position = Vector2(camera.global_position.x, camera_bottom +
	offset_below_camera)
func _on_body_entered(body):
		# Check if the body that entered is the player
	if body.has_method("die"):
		body.die()
