extends CharacterBody2D

@onready var joystick = $"../Camera2D/Joystick"
@onready var main = get_tree().get_root().get_node("main")
@onready var projectile = load("res://projectile.tscn")

var speed = 500	

func _physics_process(delta):
	var direction = joystick.posVector
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)
		
	move_and_slide()
	
func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)
	
