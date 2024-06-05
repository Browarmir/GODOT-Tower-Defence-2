extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if SaveFile.lvl_1_1_completed == true:
		$"1-x buttons/1_1/Completion11".visible = true
	if SaveFile.lvl_1_2_completed == true:
		$"1-x buttons/1_2/Completion12".visible = true
	if SaveFile.lvl_1_3_completed == true:
		$"1-x buttons/1_3/Completion13".visible = true

	
	if SaveFile.lvl_2_1_completed == true:
		$"2-x buttons2/2_1/Completion".visible = true
	if SaveFile.lvl_2_2_completed == true:
		$"2-x buttons2/2_2/Completion".visible = true
	if SaveFile.lvl_2_3_completed == true:
		$"2-x buttons2/2_3/Completion".visible = true

	
	if SaveFile.lvl_3_1_completed == true:
		$"3-x buttons3/3_1/Completion".visible = true
	if SaveFile.lvl_3_2_completed == true:
		$"3-x buttons3/3_2/Completion".visible = true
	if SaveFile.lvl_3_3_completed == true:
		$"3-x buttons3/3_3/Completion".visible = true

		





func _on_1_1_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/1_1.tscn")


func _on_1_2_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/1_2.tscn")


func _on_1_3_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/1_3.tscn")


func _on_2_1_button_down():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/2_1.tscn")


func _on_2_2_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/2_2.tscn")


func _on_2_3_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/2_3.tscn")


func _on_3_1_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/3_1.tscn")


func _on_3_2_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/3_2.tscn")


func _on_3_3_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/Levels/3_3.tscn")


func _on_back_button_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
