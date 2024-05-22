extends Node2D


var enemies = []

var bullet = preload("res://Scenes/Towers/bullet.tscn")

var building = true
var can_place = false

var current_enemy

func _physics_process(delta):
	if building == false:
		if enemies != []:
			current_enemy = enemies[0]
			$WeaponArea.look_at(current_enemy.global_position)
	else:
		$TurretRange.visible = true
		global_position = get_global_mouse_position()
		if can_place == true:
			if Input.is_action_just_pressed("L_Mouse"):
				building = false
				get_parent().tower_built()
		else:
			$Character.modulate = Color(1, 1, 1)
func _on_turret_range_area_entered(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.append(area)


func _on_turret_range_area_exited(area):
	if area.is_in_group("Enemy"):
		if building == false:
			enemies.erase(area)


func _on_shoot_timer_timeout():
	if building == false:
		if current_enemy:
			if enemies:
				if current_enemy == enemies[0]:
					var b = bullet.instantiate()
					b.global_position = $WeaponArea/SpawnPoint.global_position
					b.target = current_enemy
					get_parent().add_child(b)
					$AnimationPlayer.play("Bow_pull")


func _on_turret_area_entered(area):
	if area.is_in_group("Platform"):
		if building == true:
			can_place = true


func _on_turret_area_exited(area):
	if area.is_in_group("Platform"):
		if building == true:
			can_place = false

