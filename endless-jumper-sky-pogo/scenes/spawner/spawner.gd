extends Node

@export var platform_scene: PackedScene

@onready var platform: Platform = $Platform

func _ready() -> void:
	#platform.new_platform.connect(on_spawn_platform)
	SignalHub.new_platform.connect(on_spawn_platform)


func on_spawn_platform(old_platform_position: Vector3) -> void:
	var new_platform: Platform = platform_scene.instantiate()
	#new_platform.new_platform.connect(on_spawn_platform)
	new_platform.position = old_platform_position + Vector3(2,3, -2)
	add_child(new_platform)
	
	
