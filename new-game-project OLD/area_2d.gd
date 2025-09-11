
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
