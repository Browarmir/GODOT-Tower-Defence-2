extends Node2D

var money = 50
var wave = 0
var mobs_left = 0
var wave_mobs = [10, 6, 7, 8, 9, 0]
var wave_speed = [0.3, 1, 0.5, 0.5, 0.3, 10]
var player_health = 100
var last_tower
var instance
var enemy = preload("res://Scenes/Enemies/enemy.tscn")
var tower = preload("res://Scenes/Towers/red_tower.tscn")
var green_tower = preload("res://Scenes/Towers/green_tower.tscn")
var building = false

func _ready():
	$WaveTimer.start()
func _process(delta):
	if building == true:
		if Input.is_action_just_pressed("R_Mouse"):
			last_tower.queue_free()
			building == false
	if player_health <= 0:
		get_tree().change_scene_to_file("res://Scenes/defeat_scene.tscn")
	$GUI/Label.text = "Muneh: " + str(money)
	$GUI/HealthLabel.text = "Helf: " + str(player_health)

func tower_built():
	building = false
	money -= 25

func _on_wave_timer_timeout():
	mobs_left = wave_mobs[wave]
	$EnemyTimer.wait_time = wave_speed[wave]
	$EnemyTimer.start()


func _on_enemy_timer_timeout():
	instance = enemy.instantiate()
	$Path2D.add_child(instance)
	mobs_left -= 1
	if mobs_left <= 0:
		$EnemyTimer.stop()
		wave += 1
		print(wave)
		if wave < len(wave_mobs):
			$WaveTimer.start()
		if wave >= len(wave_mobs):
			get_tree().change_scene_to_file("res://Scenes/win_scene.tscn")


func _on_button_pressed():
	if building == false && money >= 25:
		instance = tower.instantiate()
		
		add_child(instance)
		last_tower = instance
		


func _on_gate_area_entered(area):
	if area.is_in_group("Enemy"):
		player_health -= 10


func _on_build_green_pressed():
	if building == false && money >= 50:
		instance = green_tower.instantiate()
		add_child(instance)
