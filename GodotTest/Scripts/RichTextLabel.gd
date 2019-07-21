extends RichTextLabel


func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("pause"):
		set_text("Pause")
		
func _process(delta):
	set_text("")