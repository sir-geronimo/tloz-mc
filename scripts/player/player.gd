extends KinematicBody2D

export (float) var speed := 100

onready var sprite := $Sprite
onready var animation_player := $AnimationPlayer

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

func _physics_process(_delta) -> void:
	direction = get_direction()
	velocity = direction * speed
	animation_player.play("idle_down")
	
	velocity = move_and_slide(velocity)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
