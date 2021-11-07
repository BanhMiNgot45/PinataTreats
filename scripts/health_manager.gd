extends Node2D

var time = 0.0
var health
export var interval = 8
var rng = RandomNumberGenerator.new()
var fairy

# Called when the node enters the scene tree for the first time.
func _ready():
	fairy = get_parent().get_node("fairy")
	health = load("res://scenes/health_pickup.tscn")
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = fairy.global_position
	time += delta
	if time / interval >= 1:
		time = 0.0
		var health_instance = health.instance()
		var p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
			p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		health_instance.global_position = p
		add_child(health_instance)
