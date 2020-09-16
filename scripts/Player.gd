extends Area2D


export (float) var speed = 20.0
export (float) var friction = 0.9
var target: Vector2
var velocity:= Vector2.ZERO
export (float) var dash = 100.0
signal hit
signal point

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_position(get_local_mouse_position())
	if Input.is_action_just_pressed("ui_select"):
		dash(delta)
		
func _physics_process(delta):
	velocity += target.normalized() * speed
	velocity *= friction
	if velocity.length() < 1:
		velocity += Vector2.ZERO
		
	position += velocity * delta
	
func update_position(mouse_pos:Vector2):
	target = mouse_pos

func dash(delta):
	velocity = target.normalized() *  speed * (speed + (dash * 0.4))
	velocity *= friction
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Player_body_entered(body):
	if body.get_class() == "KinematicBody2D":
		hide()  # Player disappears after being hit.
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)
	if body.get_class() == "StaticBody2D":
		body.queue_free()
		emit_signal("point")
