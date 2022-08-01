extends KinematicBody2D

export (float) var speed := 200

onready var animated_sprite := $AnimatedSprite

var acceleration := 200
var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func _physics_process(delta):
	direction = get_direction()
	velocity = direction * speed
	
	velocity = move_and_slide(velocity)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
