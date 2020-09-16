extends Position2D

var mobHouse = preload("res://MobHouse.tscn")
var cant = 3
var rng = RandomNumberGenerator.new()
var timer = 2.7
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
		if timer < 0 :
			if get_children().size() == 0:
				spawnHouses(cant)
		else:
			timer -= delta
		
func spawnHouses(cant):
	for n in range(cant):
		spawnHouse()

func spawnHouse():
	var house = mobHouse.instance()
	house.position = randomPosition()
	house.start()
	add_child(house)
	

func randomPosition():
	rng.randomize()
	var randomx = rng.randf_range(20.0, 1000.0)
	var randomy = rng.randf_range(50.0,580.0)	
	var pos:Vector2 = Vector2(randomx, randomy)
	return pos

func targetPlayer(player):
	for i in get_children():
		i.targetPlayer(player)

func start():
	isReady = true

func delete():
	for n in get_children():
		n.delete()
		n.queue_free()
