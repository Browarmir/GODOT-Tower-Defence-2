extends Node2D


func _ready():
	$pausemenu.visible = false

func _process(delta):
	pass

func pause():
	$pausemenu.visible = true
	$pausebutton.visible = false
	get_tree().paused = true
	#get_parent().set_process(false)

func _on_continue_pressed():
	get_tree().paused = false
	$pausemenu.visible = false
	$pausebutton.visible = true
	#get_parent().set_process(true)


func _on_quit_pressed():
	get_tree().paused = false
	$click.play()
	await $click.finished
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_pause_button_pressed():
	$click.play()
	pause()
