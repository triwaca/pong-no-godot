extends StaticBody2D

@export var jogador1 : bool
var velocidade : int = 500
# Limites
var y_minimo : float = 64
var y_maximo : float = 654


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if jogador1:
		print("O jogador 1 entrou na cena!")
	else:
		print("O jogador 2 entrou na cena!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	mov_jogador(delta)

func mov_jogador(delta : float) -> void:
	if jogador1:
		if Input.is_action_pressed("jogador_baixo_1"):
			position.y += velocidade * delta
			if position.y > y_maximo:
				position.y = y_maximo
		elif Input.is_action_pressed("jogador_cima_1"):
			position.y -= velocidade * delta
			if position.y < y_minimo:
				position.y = y_minimo
	else:
		if Input.is_action_pressed("jogador_baixo_2"):
			position.y += velocidade * delta
			if position.y > y_maximo:
				position.y = y_maximo
		elif Input.is_action_pressed("jogador_cima_2"):
			position.y -= velocidade * delta
			if position.y < y_minimo:
				position.y = y_minimo
