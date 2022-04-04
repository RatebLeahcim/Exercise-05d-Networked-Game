extends Spatial

onready var player1pos = $Player1Pos
onready var player2pos = $Player2Pos
onready var controlled = load("res://Player/Player.gd")
onready var passive = load("res://Player/Player_passive.gd")

func _ready():
	var player1 = preload("res://Player/Player.tscn").instance()
	player1.name = "Player1"
	player1.set_network_master(get_tree().get_network_unique_id())
	player1.global_transform = player1pos.global_transform
	player1.get_node("Mesh").get_surface_material(0).albedo_color = Color8(34,139,230)
	if Global.which_player == 1:
		player1.script = controlled
	else:
		player1.script = passive
	add_child(player1)
	
	var player2 = preload("res://Player/Player.tscn").instance()
	player2.name = "Player2"
	player2.set_network_master(Global.player2id)
	player2.global_transform = player2pos.global_transform
	player2.get_node("Mesh").get_surface_material(0).albedo_color = Color8(250,82,82)
	if Global.which_player == 2:
		player2.script = controlled
	else:
		player2.script = passive
	add_child(player2)
