extends CanvasLayer

@onready var money = get_parent().money
@onready var health =  get_parent().player_health
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthLabel.text = str(health)
	$MoneyLabel.text = str(money)
	
