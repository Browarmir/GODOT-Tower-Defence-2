extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$SFX.play()
	$Bubbles.emitting = true


func _on_timer_timeout():
	queue_free()
