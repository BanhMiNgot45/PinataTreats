extends Area2D

var fairy

# Called when the node enters the scene tree for the first time.
func _ready():
	fairy = get_parent().get_parent().get_node("fairy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_candy_body_entered(body):
	fairy.energy += 1
	queue_free()
