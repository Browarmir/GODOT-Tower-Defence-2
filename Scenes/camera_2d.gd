extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Mouse.global_position = get_global_mouse_position()




func _on_left_area_entered(area):
	print("enter")


func _on_left_area_exited(area):
	print("exit")



