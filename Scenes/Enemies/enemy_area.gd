extends Area2D

var health
# Called when the node enters the scene tree for the first time.
func _ready():
	health = get_parent().health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		get_parent().queue_free()