extends Node

const OFFSET_SIDE: Vector2 = Vector2(1.7, 4.0)
const OFFSET_UP: Vector2 = Vector2(2.7, 4.5)

@export var platform_scenes: Array[PackedScene]

@onready var platform: Platform = $Platform

func _ready() -> void:
	#platform.new_platform.connect(on_spawn_platform)
	SignalHub.new_platform.connect(on_spawn_platform)

func get_random_offset(offset_range: Vector2) -> float:
	var magnitude: float = randf_range(offset_range.x, offset_range.y)
	return magnitude if randf() < 0.5 else -magnitude


func on_spawn_platform(old_platform_position: Vector3) -> void:
	var new_platform: Platform = platform_scenes.pick_random().instantiate()
	#new_platform.new_platform.connect(on_spawn_platform)
	new_platform.position = old_platform_position + Vector3(
		get_random_offset(OFFSET_SIDE),
		randf_range(OFFSET_UP.x, OFFSET_UP.y),
		get_random_offset(OFFSET_SIDE)
	)
	add_child(new_platform)
	
	
