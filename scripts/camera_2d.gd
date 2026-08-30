extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_zona_morte_body_entered(body: Node2D) -> void:
	# Verifica se o objeto que caiu na área pertence ao grupo "jogador"
	if body.is_in_group("Player"):
		# Reinicia a fase atual do zero
		get_tree().reload_current_scene()
