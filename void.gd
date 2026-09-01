extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Verifica se o corpo que caiu é o jogador
	if body.is_in_group("player") or body.name == "Player":
		# Recarrega a cena atual imediatamente
		get_tree().reload_current_scene()
