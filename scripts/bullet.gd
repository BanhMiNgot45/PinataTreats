extends KinematicBody2D

export var velocity = Vector2.ZERO
onready var fairy = get_parent().get_node("fairy")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if collision and collision.collider_id == fairy.get_instance_id():
		fairy.health -= 1
		queue_free()
