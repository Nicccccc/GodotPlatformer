extends KinematicBody2D
var velocity = Vector2()
onready var maxHealth := 1
onready var currentHealth = maxHealth
export (float) var runSpeed = 80
export(float) var jumpHeight = 40
export(float) var jumpTime = 0.3
var spriteFacingRight = true
var skeletonAttack = false
var skeletonAttackDistance = 15
<<<<<<< HEAD
var hitboxFacingRight = true
=======
>>>>>>> cb5b857f2a54413ee7413b757428b255d68a2fc3
#value used for updating skeleton Health bar
var value
var dead := false 
#was spawned as child of SpiderBoss so nodepath changes so don't use get_node
#var player : KinematicBody2D 

onready var player:= get_node("../Player")  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func enemyTakeDamage(damage : int):
	currentHealth -= damage
	if(currentHealth <= 0):
		dead = true
		$AnimationPlayer.play("onDeath")
		
func playerTakeDamage(damage : int):
	return
	
func _physics_process(delta):
	var move = 0.0
	var gravity = 2*jumpHeight/(jumpTime*jumpTime)
	
	if(dead):
		return
<<<<<<< HEAD
		
	#skeleton attack is true when player moves into skelly range
=======
	
>>>>>>> cb5b857f2a54413ee7413b757428b255d68a2fc3
	if(skeletonAttack == false):
		if(velocity.x == 0):
			$AnimationPlayer.play("enemySkeletonIdle")
		
			
		if(position.x < player.position.x):
			move += 1
			if(velocity.x > 0):
				$Sprite.flip_h = false
			$AnimationPlayer.play("enemySkeletonWalk")
		
		if(position.x > player.position.x):
			move -= 1
			if(velocity.x < 0):
				spriteFacingRight = false
			else:
				spriteFacingRight = true
			if(!spriteFacingRight):
				$Sprite.flip_h = true
			$AnimationPlayer.play("enemySkeletonWalk")
<<<<<<< HEAD
			
=======
>>>>>>> cb5b857f2a54413ee7413b757428b255d68a2fc3
		if(abs(position.x - player.position.x) <= skeletonAttackDistance):
			skeletonAttack = true
	else:
		move = 0
<<<<<<< HEAD
		
		if(spriteFacingRight && !hitboxFacingRight):
			$enemyHitbox/CollisionShape2D.position.x *= -1
		if(!spriteFacingRight && hitboxFacingRight):
			$enemyHitbox/CollisionShape2D.position.x *= -1
		$AnimationPlayer.play("skeletonAttack")

=======
		$AnimationPlayer.play("skeletonAttack")
#		if(abs(position.x - player.position.x) > skeletonAttackDistance):
#			skeletonAttack = false
>>>>>>> cb5b857f2a54413ee7413b757428b255d68a2fc3

	velocity.x = move * runSpeed
	velocity.y += gravity*delta
	# -y is up, +y is down
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_AnimationPlayer_animation_finished(anim_name):
		if(abs(position.x - player.position.x) > skeletonAttackDistance):
			skeletonAttack = false
