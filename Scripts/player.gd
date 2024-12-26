extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var death = false

@onready var sprite_index: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("m_left", "m_right")
	
	if direction > 0:
		sprite_index.flip_h = false
	elif direction < 0:
		sprite_index.flip_h = true
	
	# Play Animations
	
	if is_on_floor():
		if direction == 0:
			sprite_index.play("idle")
		else:
			sprite_index.play("move")
	else:
		sprite_index.play("jump")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not has_node("CollisionShape2D"):
		death = true
	
	if death == true:
		velocity.x = 0

	move_and_slide()
