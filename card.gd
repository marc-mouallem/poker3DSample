extends CharacterBody3D


@export var dealing_speed = 0.3

func _physics_process(_delta):
	move_and_collide(velocity)


func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.DOWN)
	velocity = Vector3.FORWARD * dealing_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()


func _on_ready() -> void:
	$CardSound.play()
