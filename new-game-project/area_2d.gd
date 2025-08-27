
extends Area2D

@onready var timer:Timer = $Timer


	
func _on_timer_timeout():
	get_tree().reload_current_scene()


func _on_body_entered(body: Node2D) -> void:
	print("You Died!")
	timer.start()
	
	# Attach this script to the Killzone node
  # or Node2D, whatever your killzone is

# Reference to the camera node
var camera: Camera2D

# Offset so the killzone stays a bit below the camera (adjust as needed)
var offset_y = 200  

func _ready():
	# Find the camera node, change the path accordingly
	camera = get_node("/root/YourScene/Player/Camera2D")

func _process(delta):
	# Make killzone follow the camera's vertical position with offset
	var cam_pos = camera.global_position
	global_position.y = cam_pos.y + offset_y
