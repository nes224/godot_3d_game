extends Camera3D


@export var buffer: Vector3 = Vector3(0, 10, 8)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.new_platform.connect(on_spawn_platform)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_spawn_platform(old_platform_position: Vector3) -> void:
	position = old_platform_position + buffer
