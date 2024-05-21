extends PathFollow2D


var health = 5
var max_health
var speed = 125
@onready var progress_bar = $ProgressBar
@onready var game = get_parent().get_parent()


func _ready():
	max_health = health
	progress_bar.min_value = 0
	progress_bar.max_value = health
	progress_bar.visible = false
	pass
	
func _process(delta):
	if health <= 0:
		game.mobs_left -= 1
		game.money += 10
		queue_free()
	progress_bar.value = health
	if progress_bar.value < progress_bar.max_value:
		progress_bar.visible = true
	

func _physics_process(delta):
	progress += speed * delta
	if progress >= 10000:
		queue_free()


