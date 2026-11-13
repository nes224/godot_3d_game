class_name Player
extends CharacterBody3D

const JUMP_FORCE: float = 20.0
#const GRAVITY: float = 60.0
var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta:  float) -> void:
	handle_gravity(delta)
	move_and_slide()
	
func handle_gravity(delta: float) -> void:
	velocity.y -= (_gravity * delta) * 2
	if is_on_floor():
		velocity.y = JUMP_FORCE
