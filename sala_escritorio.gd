extends Control

@onready var input_pin = $PopupCelular/CelularUI/LineEdit
@onready var teclado = $PopupCelular/CelularUI/GridContainer
@onready var mensagem_pin = $PopupCelular/CelularUI/MensagemPIN

func _ready():
	# Garante que o modal sempre inicie escondido quando a sala carregar
	$PopupPC.hide()
	$PopupCelular.hide()
	
	# Laço para conectar os botões do celular via código (padrão Godot 4)
	for filho in teclado.get_children():
		# Verifica se o nó atual é realmente um botão (ignora os 'Controls' vazios do layout)
		if filho is Button:
			# .bind() passa o texto do botão (ex: "1", "2") como argumento para a função
			filho.pressed.connect(_on_botao_numero_pressed.bind(filho.text))

func _on_botao_pc_pressed():
	# Torna o modal visível
	$PopupPC.show()

func _on_botao_fechar_pc_pressed():
	# Esconde o modal
	$PopupPC.hide()
	
func _on_botao_celular_pressed() -> void:
	$PopupCelular.show()

func _on_botao_fechar_cel_pressed() -> void:
	$PopupCelular.hide()

func _on_botao_numero_pressed(numero_digitado: String):
	# Adiciona o número ao input
	input_pin.text += numero_digitado
	
	# Auto-verificação no 4º dígito
	if input_pin.text.length() == 4:
		validar_pin()

func validar_pin():
	if input_pin.text == "1234": 
		# Feedback de Sucesso
		mensagem_pin.text = "DESBLOQUEADO"
		mensagem_pin.modulate = Color.GREEN # Muda a cor do texto para verde
		
		# Opcional: Aqui também colocaremos um delay pequeno antes de 
		# sumir com essa tela e mostrar a tela dos apps/dicas do celular
		
	else:
		# Feedback de Erro
		mensagem_pin.text = "PIN INCORRETO"
		mensagem_pin.modulate = Color.RED # Muda a cor do texto para vermelho
		
		# O Timer que já havíamos colocado
		await get_tree().create_timer(2).timeout 
		
		# Limpa o input e volta a mensagem para o estado original
		input_pin.text = "" 
		mensagem_pin.text = "Aguardando PIN..."
		mensagem_pin.modulate = Color.WHITE # Volta para a cor branca original
