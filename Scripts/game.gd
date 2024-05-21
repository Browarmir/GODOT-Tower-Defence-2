extends Node2D

var money = 50
var wave = 0
var mobs_left = 0
var mob1_left_to_spawn
var mob2_left_to_spawn
var wave_mobs_1 = [5, 5, 10, 8, 9, 0]
var wave_mobs_2 = [2, 4, 5, 6, 7, 0]
var wave_speed = [0.1, 1, 0.5, 0.5, 0.3, 10]
var player_health = 100
var last_tower
var instance
var enemy = preload("res://Scenes/Enemies/enemy.tscn")
var enemy2 = preload("res://Scenes/Enemies/enemy_2.tscn")
var tower = preload("res://Scenes/Towers/red_tower.tscn")
var green_tower = preload("res://Scenes/Towers/green_tower.tscn")
var building = false
var menu_visible = false

func _ready():
	$GUI/StartButton.visible = true
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
	mob1_left_to_spawn = wave_mobs_1[wave]
	mob2_left_to_spawn = wave_mobs_2[wave]
	mobs_left = wave_mobs_1[wave] + wave_mobs_2[wave]
	$EnemyTimer.wait_time = wave_speed[wave]
	$EnemyTimer.start()

func _on_enemy_timer_timeout():
	var random = randf_range(-1, 1)
	if random >= 0:
		if mob1_left_to_spawn > 0:
			mob1_left_to_spawn -= 1
			instance = enemy.instantiate()
			$Path2D.add_child(instance)
		
	else:
		if mob2_left_to_spawn > 0:
			mob2_left_to_spawn -= 1
			instance = enemy2.instantiate()
			$Path2D.add_child(instance)
		
	if mobs_left <= 0:
		$EnemyTimer.stop()
		wave += 1
		print(wave)
		if wave < len(wave_mobs_1):
			$GUI/StartButton.visible = true
		if wave >= len(wave_mobs_1):
			get_tree().change_scene_to_file("res://Scenes/win_scene.tscn")


func _on_button_pressed():
	if building == false && money >= 25:
		hide_build_menu()
		instance = tower.instantiate()
		add_child(instance)
		last_tower = instance
		

func _on_gate_area_entered(area):
	if area.is_in_group("Enemy"):
		player_health -= 10
		area.get_parent().health -= 1000

func _on_build_green_pressed():
	if building == false && money >= 50:
		hide_build_menu()
		instance = green_tower.instantiate()
		add_child(instance)
		last_tower = instance


func _on_start_button_pressed():

	$GUI/StartButton.visible = false
	$WaveTimer.start()


func _on_show_build_pressed():
	if menu_visible == false:
		show_build_menu()
	else:
		hide_build_menu()

func show_build_menu():
	menu_visible = true
	$"GUI/Build panel".visible = true
	$GUI/ShowBuild.visible = false

func hide_build_menu():
	menu_visible = false
	$"GUI/Build panel".visible = false
	$GUI/ShowBuild.visible = true
