extends Area2D

var damage := 1
var hitTarget := false
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hitTarget):
		queue_free()


func _on_BossProjectileHitbox_body_entered(body):
	body.playerTakeDamage(damage)
	hitTarget = true
	
