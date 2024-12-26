extends Area2D

@onready var game_manager: Node = %Game_Manager
@onready var anim_manager: AnimationPlayer = $Anim_Manager

func _on_body_entered(body):
	game_manager.add_score()
	anim_manager.play("pickup")
