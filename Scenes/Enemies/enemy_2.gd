extends PathFollow2D

var value = 10
var health = 200
var speed = 75
@onready var progress_bar = $ProgressBar
@onready var game = get_parent().get_parent()
var emeralds = preload("res://Scenes/emerald_drop.tscn")
func _ready():
	progress_bar.min_value = 0
	progress_bar.max_value = health
	progress_bar.visible = false
	pass
	
func _process(delta):
	if health <= 0:
		game.mobs_left -= 1
		var b = emeralds.instantiate()
		b.global_position = global_position
		get_parent().get_parent().add_child(b)
		b.emeralds.amount = value
		b.emeralds.emitting = true
		game.money += value
		queue_free()
		
	progress_bar.value = health
	if progress_bar.value < progress_bar.max_value:
		progress_bar.visible = true
	

func _physics_process(delta):
	progress += speed * delta
	if progress >= 10000:
		queue_free()


