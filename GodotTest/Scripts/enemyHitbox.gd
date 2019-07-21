extends Area2D

#making variable for first layer, switch layer on attacks
#hitbox has to be on a different layer when disabled to properly work
#don't forget to flip the hitbox when the skelly turns around
onready var startLayer := collision_layer
onready var startMask := collision_mask
#just using := infers type, copies right side type
var disabled := true
export var damage := 1

func _ready():
	disable()

func toggleDisabled():
	disabled = !disabled
	if disabled:
		#corresponds to the enemyHitbox layer in binary
		collision_layer = 32
		collision_mask = 0
	else:
		collision_layer = startLayer
		collision_mask = startMask
		
func enable():
	disabled = false
	collision_layer = startLayer
	collision_mask = startMask
	
func disable():
	disabled = true
	collision_layer = 32
	collision_mask = 0
	
#had an error where it sayed on playerHitbox, make sure to check details 
func _on_enemyHitbox_body_entered(body):
	body.playerTakeDamage(damage)