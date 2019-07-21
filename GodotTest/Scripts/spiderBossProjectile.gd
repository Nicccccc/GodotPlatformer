extends KinematicBody2D

var SPEED = 200
var velocity = Vector2()
export(float) var jumpHeight = 100
export(float) var jumpTime = 0.5
onready var player = get_node("../Player")
onready var spawnReady := true

func _ready():
	velocity.y = -jumpHeight/jumpTime
	
func spawnSkeleton():
	if(spawnReady):
		var skeletonSpawn_resource = preload("res://Scenes/Enemy.tscn")
		#instance lets us use the preload
		var skeletonSpawn = skeletonSpawn_resource.instance()
	#	skeletonSpawn.player = player as KinematicBody2D
		skeletonSpawn.position = $"projectileSpawn".position
		get_tree().get_root().add_child(skeletonSpawn)
		spawnReady = false
	else:
		pass
	
func enemyTakeDamage(damage):
	$AnimationPlayer.play("onDeath")
	
func _process(delta):
	var gravity = 2*jumpHeight/(jumpTime*jumpTime)
	#starts the bouncing
	if(is_on_wall()):
		spawnSkeleton()
		$AnimationPlayer.play("onDeath")
	
	#check to bounce
	if(is_on_floor()):
		velocity.y = -jumpHeight/jumpTime
	#constant deceleration
	velocity.y += gravity*delta
	velocity.x = SPEED
	velocity = move_and_slide(velocity, Vector2(0, -1))
