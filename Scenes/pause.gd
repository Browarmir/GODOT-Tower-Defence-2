extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func pause():
	visible = true
	get_parent().set_process(false)




func _on_continue_pressed():
	visible = false
	get_parent().set_process(true)


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
