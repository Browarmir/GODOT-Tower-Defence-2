extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$Click.play()
	await $Click.finished
	get_tree().change_scene_to_file("res://Scenes/level_selection.tscn")


func _on_options_button_down():
	$Click.play()


func _on_quit_button_down():
	$Click.play()
	SaveFile.save_data()
	$AnimationPlayer.play("fade_out")
	



func _on_animation_player_animation_finished(anim_name):
	get_tree().quit()
