extends Area2D

var posicaoInicial : Vector2 = Vector2(640,360)
var velocidadeBola : int = 500
var novaDirecaoBola : Vector2 = Vector2(0,0)
var direcaoBola : Vector2 = Vector2(0,0)

var minY : int = 0
var maxY : int = 720

#timer
@onready var timer : Timer = $Timer

func _ready() -> void:
	resetarBola()

func _process(delta: float) -> void:
	moveBola(delta)
	colidirComParedes()

func rodarTimer() -> void:
	timer.start()

func resetarBola() -> void:
	print("Novo jogo, bola ao centro")
	position = posicaoInicial
	determinaDirecao()

func determinaDirecao() -> void:
	var xpos : int = [-1,1].pick_random()
	var ypos : int = [-1,1].pick_random()
	
	direcaoBola = Vector2(xpos,ypos)
	novaDirecaoBola = direcaoBola

func moveBola(delta: float) -> void:
	position += novaDirecaoBola * velocidadeBola * delta
	
func colidirComParedes() -> void:
	if position.y > maxY:
		novaDirecaoBola.y *= -1
	if position.y < minY:
		novaDirecaoBola.y *= -1


func _on_body_entered(body: Node2D) -> void:
	print("Rebateu!")
	if body.is_in_group("jogadores"):
		novaDirecaoBola.x *= -1

func _on_timer_timeout() -> void:
	resetarBola()
