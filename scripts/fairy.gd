extends KinematicBody2D

export var speed = 100.0
export var max_health = 20
var velocity = Vector2.ZERO
var health = 15
var energy = 0
onready var text = $RichTextLabel
onready var energy_text = get_parent().get_node("energy_label")
onready var pinata_manager = get_parent().get_node("enemy_manager")

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	text.text = "Health: " + str(health)
	if get_parent().name == "level_three":
		$Sprite.texture = load("res://sprites/bloody_fairy.png")
		energy = 5
		remove_child($RichTextLabel)


func _process(delta):
	if health <= 0:
		get_tree().reload_current_scene()
	text.text = "Health: " + str(health)
	if get_parent().name != "level_three":
		energy_text.text = "Energy Gained: " + str(energy)
	else:
		energy_text.text = str(energy)
	if energy >= 13 and get_parent().name == "level_two":
		$Sprite.texture = load("res://sprites/bloody_fairy.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#velocity.y += gravity * delta
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
	else:
		velocity.y = 0
	move_and_slide(velocity, Vector2.UP)
