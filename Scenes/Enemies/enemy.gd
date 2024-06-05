extends PathFollow2D


var health = 100
var max_health
var speed = 50
var value = 5
var gate_damage = 5
@onready var progress_bar = $ProgressBar
@onready var game = get_parent().get_parent()
var emeralds = preload("res://Scenes/emerald_drop.tscn")

func _ready():
	max_health = health
	progress_bar.min_value = 0
	progress_bar.max_value = health
	progress_bar.visible = false
	pass
	
func _process(delta):
	if health <= 0:
		if !$AnimationPlayer.is_playing():
			$AnimationPlayer.play("death_animation")
		
	progress_bar.value = health
	if progress_bar.value < progress_bar.max_value:
		progress_bar.visible = true
	

func _physics_process(delta):
	progress += speed * delta
	if progress >= 10000:
		queue_free()

func deal_damage(value):
	health -= value
	$AnimationPlayer.play("hurt_animation")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "death_animation":
		game.mobs_left -= 1
		game.money += value
		var b = emeralds.instantiate()
		b.global_position = global_position
		get_parent().get_parent().add_child(b)
		b.emeralds.amount = value
		b.emeralds.emitting = true
		queue_free()
