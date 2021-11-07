extends Area2D

signal dead
signal popped(pos)

export var health_max = 10
var health = health_max
onready var label = get_node("RichTextLabel")
onready var fairy = get_parent().get_parent().get_node("fairy")
onready var manager = get_parent()
var blood_splatter
var ran = false
var a = ["res://sprites/human_one_a.png", "res://sprites/human_two_a.png", "res://sprites/human_three_a.png", "res://sprites/human_four_a.png"]
var b = ["res://sprites/human_one_b.png", "res://sprites/human_two_b.png", "res://sprites/human_three_b.png", "res://sprites/human_four_b.png"]
var human_manager

# Called when the node enters the scene tree for the first time.
func _ready():
	human_manager = get_parent()
	var organ = get_parent().get_parent().get_node("organ_manager")
	connect("dead", human_manager, "_on_dead")
	connect("popped", organ, "_on_popped")
	label.text = "Health: " + str(health_max)
	blood_splatter = load("res://scenes/blood_splatter.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(health)
	if health <= 7 and  health > 4:
		$Sprite.texture = load(a[human_manager.current])
	elif health <= 4:
		$Sprite.texture = load(b[human_manager.current])
	if health <= 0 and not ran:
		ran = true
		emit_signal("dead")
		emit_signal("popped", global_position)
		queue_free()
		
func _on_human_body_entered(body):
	if body.name.count("bat") > 0:
		health -= 1
	add_child(blood_splatter.instance())
	body.queue_free()
