class_name Player
extends CharacterBody3D

const JUMP_FORCE: float = 32.0
const GRAVITY: float = 60.0
const ROTATION_SPEED: float = 4.0
const MOVE_SPEED: float = 3.5
#var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animation_player: AnimationPlayer = $"character-female-a2/AnimationPlayer"

func _physics_process(delta:  float) -> void:
	handle_gravity(delta)
	handle_movement()
	handle_rotation(delta)
	move_and_slide()
	handle_animation()
	
func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		rotate_y(ROTATION_SPEED * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-ROTATION_SPEED * delta)
	
func handle_movement() -> void:
	var forward: Vector3 = transform.basis.z * Input.get_action_strength("ui_up")
	velocity.x = forward.x * MOVE_SPEED
	velocity.z = forward.z * MOVE_SPEED
	
func handle_animation() -> void:
	if velocity.y > 0:
		animation_player.play("jump")
	else:
		animation_player.play("fall")
	
func handle_gravity(delta: float) -> void:
	velocity.y -= GRAVITY * delta
	if is_on_floor():
		velocity.y = JUMP_FORCE
