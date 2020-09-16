extends Area2D

var mobScene = preload("res://Mob2.tscn")
var posPlayer
var Mobs2:Array
var timer = 1
var isReady = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isReady:
		if timer < 0:
			if $Mobs.get_children().size() == 0:
				spawn()
		else:
			timer -= delta

func targetPlayer(player):
	posPlayer = player.global_position
	for i in $Mobs.get_children():
		i.targetPlayer(player.position)

func spawn():
	var mob = mobScene.instance()
	$Mobs.add_child(mob)
	mob.follow(posPlayer)
	
func _on_SpawnMobs_timeout():
	spawn()

func _on_DeleteMobs_timeout():
	for i in range(1):
		$Mobs.get_child(i).delete()
	
func delete():
	for n in get_children():
		n.queue_free()

func start():
	isReady = true
