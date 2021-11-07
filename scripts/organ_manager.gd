extends Node2D

var sprites = ["res://sprites/brain.png", "res://sprites/entrails.png", "res://sprites/heart.png", "res://sprites/liver.png"]
var organ
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	organ = load("res://scenes/organ.tscn")
	rng.randomize()
	
func _on_popped(pos):
	var organ_instance = organ.instance()
	organ_instance.position = pos
	organ_instance.get_node("Sprite").texture = load(sprites[rng.randi_range(0, 3)])
	add_child(organ_instance)
