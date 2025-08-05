extends Camera2D
@export var player: NodePath  # assign via inspector to your Player node


@export var follow_speed : float = 10.0
@export var current = true

func _ready() -> void:
	current = true  # Activate this camera

func _process(delta: float) -> void:
	var target = get_node(player) as Node2D
	if target:
		position.y = target.position.y
		#position.x = some_fixed_x
