extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# O símbolo $ serve para acessar diretamente um nó filho na árvore.
# @onready garante que a variável só seja carregada quando a tela estiver pronta.
@onready var input_nome = $LineEdit
@onready var aviso_erro = $AvisoErro

func _on_button_pressed():
	# strip_edges() remove espaços em branco no começo e no fim
	var nome_do_time = input_nome.text.strip_edges()
	
	# Validação 1: Está vazio?
	if nome_do_time == "":
		aviso_erro.text = "ALERTA: O nome da equipe é obrigatório!"
		return # Interrompe a função aqui, não deixa mudar de tela
		
	# Validação 2: É muito curto?
	if nome_do_time.length() < 3:
		aviso_erro.text = "ALERTA: O nome deve ter pelo menos 3 letras."
		return
		
	# Se passou nas validações, limpa o erro (caso tivesse algum)
	aviso_erro.text = ""
	
	Global.nome_equipe = nome_do_time
	print("Time validado e salvo no Global: ", Global.nome_equipe)
	
	# Muda para a tela do escritório
	get_tree().change_scene_to_file("res://sala_escritorio.tscn")
