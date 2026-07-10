class_name Player
extends CharacterBody2D


@export var move_speed: float = 50
@export var animator: AnimatedSprite2D

var is_game_over: bool = false

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#velocity = Vector2(50, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_game_over:
		# Accpet user input via keyboard, and set velocity
		velocity = Input.get_vector("left", "right", "up", "down") * move_speed
		
		# Play idle animation when velocity == 0
		# Play run animation when velocity != 0
		if velocity == Vector2.ZERO:
			animator.play("idle")
		else:
			animator.play("run")
		
		# Move according to velocity
		move_and_slide()


func game_over():
	is_game_over = true
	animator.play("game_over")
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()
