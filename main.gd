extends Node

@export var card_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dealing_timer_timeout() -> void:
	var card_spawn_location = get_node("Dealer/CardsPath/SpawnLocation")
	var player1_position = $Player.position
	var player2_position = $Player2.position
	var card = card_scene.instantiate()
	var card2 = card_scene.instantiate()
	card.initialize(card_spawn_location.position, player1_position)
	card2.initialize(card_spawn_location.position, player2_position)
	var timer := Timer.new()
	add_child(timer)
	add_child(card)
	add_child(card2)
