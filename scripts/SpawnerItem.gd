extends Position2D

var itemScene = preload("res://Item.tscn")
var cantItems = 7
var rng = RandomNumberGenerator.new()
var timer = 2.7
var isReady = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isReady:
		if timer < 0:
			if get_children().size() == 0:
				spawnItems(cantItems)
		else:
			timer -= delta
		
func spawnItems(cant):
	for n in range(cant):
		spawnItem()
 
func spawnItem():
	var item = itemScene.instance()
	item.position = randomPosition()
	add_child(item)

func randomPosition():
	rng.randomize()
	var randomx = rng.randf_range(20.0, 1000.0)
	var randomy = rng.randf_range(50.0,580.0)	
	var pos:Vector2 = Vector2(randomx, randomy)
	return pos
	
func start():
	isReady = true

	
func delete():
	for n in get_children():
		n.queue_free()
