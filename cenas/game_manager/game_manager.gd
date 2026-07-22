extends Node2D

var pontuacao_jogador_1 : int = 0
var pontuacao_jogador_2 : int = 0

@onready var bola : Area2D = $"../Bola"

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_gol_1_area_entered(area: Area2D) -> void:
	print("Gol do jogador 2!")
	pontuacao_jogador_2 += 1
	bola.rodarTimer()

func _on_gol_2_area_entered(area: Area2D) -> void:
	print("Gol do jogador 1!")
	pontuacao_jogador_1 += 1
	bola.rodarTimer()
