extends Area2D


var move = Vector2.ZERO
var speed = 10
var look_vec = Vector2.ZERO
var target
var damage = 10
var overlapping = []
var active = false
var once_activated = false
var bubbles = preload("res://Scenes/Towers/potion_explosion.tscn")
@onready var explosion_range = $Explosion/CollisionShape2D
func _ready():
	explosion_range.disabled = true
	$CollisionShape2D.shape.radius = 8
	if target != null:
		$Sprite2D.look_at(target.global_position)
		look_vec = target.global_position - global_position

func _process(delta):
	
	if active == true:
		explosion_range.disabled = false

func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	global_position += move

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func explode():
	var b = bubbles.instantiate()
	b.global_position = global_position
	get_parent().add_child(b)
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		active = true
#		
		var b = bubbles.instantiate()
		b.global_position = global_position
		get_parent().add_child(b)
		$qfree_timer.start()
		speed = 0


func _on_timer_timeout():
	explode()


func _on_explosion_area_entered(area):
	if area.is_in_group("Enemy"):
		area.get_parent().health -= 50


func _on_qfree_timer_timeout():
	queue_free()
