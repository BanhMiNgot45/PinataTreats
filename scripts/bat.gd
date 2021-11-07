extends KinematicBody2D

export var rotate = 1.5
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().get_parent().get_parent().name == "level_three":
		$Sprite.texture = load("res://sprites/bloody_bat.png")
	transform.origin.x = $Sprite.texture.get_width() / 2
	transform.origin.y = $Sprite.texture.get_height() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotate * delta
	move_and_collide(velocity)
