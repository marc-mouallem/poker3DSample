extends Node

@export var card_scene: PackedScene
var deal_card_audio = preload("res://assets/sounds/card-sounds-35956.mp3")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var card_spawn_location = get_node("Dealer/CardsPath/SpawnLocation")
	var players = get_tree().get_nodes_in_group("Player")
	for card_num in range(Globals.card_number_per_player):
		card_spawn_location.position.z += card_num * 5
		for player in players:
			var card = card_scene.instantiate()
			card.initialize(card_spawn_location.position, player.position)
			add_child(card)
			await get_tree().create_timer(0.6).timeout # Replace with function body.
	transition_camera_to_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func transition_camera_to_player():
	$CameraPivot/Camera3D.position.x = 0
	$CameraPivot/Camera3D.position.y = 5.531
	$CameraPivot/Camera3D.position.z = 3
	$CameraPivot/Camera3D.rotation.x = -95
	$CameraPivot/Camera3D.rotation.y = 0
	$CameraPivot/Camera3D.rotation.z = 0
