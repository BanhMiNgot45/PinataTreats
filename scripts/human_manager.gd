extends Node2D

export var health = 10
var sprites = ["res://sprites/human_one.png", "res://sprites/human_two.png", "res://sprites/human_three.png", "res://sprites/human_four.png"]
var rng = RandomNumberGenerator.new()
var fairy
var current

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	fairy = get_parent().get_node("fairy")
	var pos = fairy.global_position
	var human = load('res://scenes/human.tscn')
	var human_instance = human.instance()
	human_instance.health = self.health
	var p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
	while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
		p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
	human_instance.global_position = p
	current = rng.randi_range(0, 3)
	human_instance.get_node("Sprite").texture = load(sprites[current])
	add_child(human_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_dead():
	fairy = get_parent().get_node("fairy")
	var pos = fairy.global_position
	var human = load('res://scenes/human.tscn')
	var human_instance = human.instance()
	human_instance.health = self.health
	var p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
	while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
		p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
	human_instance.global_position = p
	current = rng.randi_range(0, 3)
	human_instance.get_node("Sprite").texture = load(sprites[current])
	add_child(human_instance)
