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

func _on_button_pressed():
	# Pegamos o valor da propriedade 'text' do nosso LineEdit
	var nome_do_time = input_nome.text
	
	# Validação simples
	if nome_do_time == "":
		print("Por favor, digite o nome da equipe!")
		return
		
	# Se deu tudo certo, mostramos no console
	print("O time ", nome_do_time, " está pronto para começar o Escape Room!")
	
	# Futuramente, colocaremos aqui a lógica para salvar esse nome e abrir a sala do escritório.
