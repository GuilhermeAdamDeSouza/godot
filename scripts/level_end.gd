extends Area2D

# Arraste o arquivo da próxima fase para este campo no Inspetor
@export var next_scene: PackedScene 

func _on_body_entered(body: Node2D) -> void:
	# Verifica se o nó que entrou pertence ao grupo do jogador
	if body.is_in_group("player"):
		complete_level()

func complete_level() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	else:
		print("Próxima fase não configurada no Inspetor!")
