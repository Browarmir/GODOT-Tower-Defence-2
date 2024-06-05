extends Node

var save_path = "res://savedata.res"

var lvl_1_1_completed = false
var lvl_1_2_completed = false
var lvl_1_3_completed = false

var lvl_2_1_completed = false
var lvl_2_2_completed = false
var lvl_2_3_completed = false

var lvl_3_1_completed = false
var lvl_3_2_completed = false
var lvl_3_3_completed = false


func _ready():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		lvl_1_1_completed = file.get_var(lvl_1_1_completed)
		lvl_1_2_completed = file.get_var(lvl_1_2_completed)
		lvl_1_3_completed = file.get_var(lvl_1_3_completed)
		lvl_2_1_completed = file.get_var(lvl_2_1_completed)
		lvl_2_2_completed = file.get_var(lvl_2_2_completed)
		lvl_2_3_completed = file.get_var(lvl_2_3_completed)
		lvl_3_1_completed = file.get_var(lvl_3_1_completed)
		lvl_3_2_completed = file.get_var(lvl_3_2_completed)
		lvl_3_3_completed = file.get_var(lvl_3_3_completed)
	else:
		lvl_1_1_completed = false
		lvl_1_2_completed = false
		lvl_1_3_completed = false

		lvl_2_1_completed = false
		lvl_2_2_completed = false
		lvl_2_3_completed = false

		lvl_3_1_completed = false
		lvl_3_2_completed = false
		lvl_3_3_completed = false
		
		
func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(lvl_1_1_completed)
	file.store_var(lvl_1_2_completed)
	file.store_var(lvl_1_3_completed)
	
	file.store_var(lvl_2_1_completed)
	file.store_var(lvl_2_2_completed)
	file.store_var(lvl_2_3_completed)
	
	file.store_var(lvl_3_1_completed)
	file.store_var(lvl_3_2_completed)
	file.store_var(lvl_3_3_completed)
