extends Node

@export var platform_scene: PackedScene

func on_spawn_platform(old_platform_position: Vector3) -> void:
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.position = old_platform_position + Vector3(2,5, -2)
	add_child(new_platform)
	
	
func _on_platform_new_platform(platform_pos: Vector3) -> void:
	on_spawn_platform(platform_pos)
