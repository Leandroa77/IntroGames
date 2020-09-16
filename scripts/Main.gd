extends Node2D


var itemScene = preload("res://SpawnerItem.tscn")
var mobSpawnerScene = preload("res://MobSpawner.tscn")
var mobHouse
var mobSpawn
var item
var player
var isReady
var score
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	player = get_node("Player")
	
	item = itemScene.instance()
	add_child(item)
	mobSpawn = mobSpawnerScene.instance()
	add_child(mobSpawn)
	player.hide()

	
func _process(delta):
	mobSpawn.targetPlayer(player)
		
func gameOver():
	item.hide()
	mobSpawn.hide()
	mobSpawn.delete()
	item.delete()
	$HUD.show_game_over()
	resetGame()
	
func resetGame():	
	yield(get_tree().create_timer(3.0), "timeout")
	get_tree().reload_current_scene()

func startGame():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	mobSpawn.start()
	item.start()

func scorePoint():
	score += 100
	$HUD.update_score(score)



