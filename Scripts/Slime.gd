extends Node2D

const speed = 1


@onready var ray_cast_left: RayCast2D = $"RayCast Left"
@onready var ray_cast_right: RayCast2D = $"RayCast Right"
@onready var sprite: AnimatedSprite2D = $Sprite

var direction = 1

func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true
	
	position.x += speed * direction
