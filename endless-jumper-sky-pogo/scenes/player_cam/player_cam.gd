extends Camera3D

@export var buffer: Vector3 = Vector3(0, 10, 8)
@export var smooth_speed: float = 2.0

var _base_position: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.new_platform.connect(on_spawn_platform)
	_base_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if position.distance_to(_base_position) < 0.01:
		position = _base_position
	else:
		position = position.lerp(_base_position, smooth_speed * delta) # 10%
		

func on_spawn_platform(old_platform_position: Vector3) -> void:
	_base_position = old_platform_position + buffer
