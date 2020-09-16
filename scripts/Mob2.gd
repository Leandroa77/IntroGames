extends KinematicBody2D

export (float) var speed = 80
export (float) var friction = 0.9
var target_player:Vector2
var target:Vector2
var tiene_target = false
var dir
var deltaP
var posP
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite.visible = !$Sprite.visible
	pass
func _process(delta):
	dir = (posP - global_position).normalized()
	position += speed * dir * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.

func follow(positionP):
	look_at(positionP)
	
	
func targetPlayer(positionP):
	posP = positionP
	follow(positionP)

func delete():
	queue_free()
